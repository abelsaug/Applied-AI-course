import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error
from sklearn import preprocessing
import xgboost as xgb

def load_train_data():
    train = pd.read_csv('train.csv')
    labels = train.target.values
    lbl_enc = preprocessing.LabelEncoder()
    labels = lbl_enc.fit_transform(labels)

    train = train.drop('id', axis=1)
    train = train.drop('target', axis=1)
    return train.values, labels.astype('int32')

def xgboost_run(X_train, X_test, y_train, y_test):
    dtrain = xgb.DMatrix(X_train, label=y_train)
    dtest = xgb.DMatrix(X_test, label=y_test)
    num_boost_round = 350


    # params = {
    # # Parameters that we are going to tune.
    # 'max_depth':110,
    # 'min_child_weight': 1.5,
    # 'eta':0.0199,
    # 'subsample': 0.8,
    # 'colsample_bytree': 0.8,

    # 'num_class': 9,
    # # Other parameters
    # 'objective':'multi:softprob',
    # 'silent' : 1    }

    # params['eval_metric'] = "mlogloss"




    # params = {
    # # Parameters that we are going to tune.
    # 'max_depth':100,
    # 'min_child_weight': 5.2475,
    # 'eta':0.0825,
    # 'gamma':0.03,
    # 'subsample': 0.85,
    # 'colsample_bytree': 0.8,
    # 'nthread': -1,
    # 'num_class': 9,
    # # Other parameters
    # 'objective':'multi:softprob',
    # 'silent' : 1    }

    # params['eval_metric'] = "mlogloss"


    params = {
    # Parameters that we are going to tune.
    'max_depth':10,
    'min_child_weight': 5.2475,
    'eta':0.0825,
    'gamma':0.03,
    'subsample': 0.85,
    'colsample_bytree': 0.8,
    'nthread': -1,
    'num_class': 9,
    # Other parameters
    'objective':'multi:softprob',
    'silent' : 1    }

    params['eval_metric'] = "mlogloss"









    # params['tree_method'] = 'exact'
    # params['updater'] = 'grow_gpu'



    # gridsearch_params = [
    # (max_depth, min_child_weight)
    # for max_depth in range(5,300)
    # for min_child_weight in range(1,5)
    # ]


    # min_mae = float("Inf")
    # best_params = None
    # for max_depth, min_child_weight in gridsearch_params:
    #     print("CV with max_depth={}, min_child_weight={}".format(
    #                              max_depth,
    #                              min_child_weight))

    #     # Update our parameters
    #     params['max_depth'] = max_depth
    #     params['min_child_weight'] = min_child_weight

    #     # Run CV
    #     cv_results = xgb.cv(
    #     params,
    #     dtrain,
    #     num_boost_round=num_boost_round,
    #     seed=42,
    #     nfold=5,
    #     metrics={'mlogloss'},
    #     early_stopping_rounds=10
    #     )

    #     print cv_results['test-mlogloss-mean'].min()

    #     # Update best MAE
    #     mean_mae = cv_results['test-mlogloss-mean'].min()
    #     boost_rounds = cv_results['test-mlogloss-mean'].argmin()
    #     print("\tMAE {} for {} rounds".format(mean_mae, boost_rounds))
    #     if mean_mae < min_mae:
    #         min_mae = mean_mae
    #         best_params = (max_depth,min_child_weight)

    # print("Best params: {}, {}, MAE: {}".format(best_params[0], best_params[1], min_mae))






    model = xgb.train(
    params,
    dtrain,
    num_boost_round=num_boost_round,
    evals=[(dtest, "Test")],
    early_stopping_rounds=10
    )
    print("Best Mean Logloss: {:.2f} with {} rounds".format(
                 model.best_score,
                 model.best_iteration+1))
    model.save_model("xgboost_model3.model")
X, y = load_train_data()
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1234)
xgboost_run(X_train, X_test, y_train, y_test)