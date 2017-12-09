from sklearn.externals import joblib
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error
from sklearn import preprocessing
import xgboost as xgb

def xgboost_run(X_train, X_test, y_train, y_test):
    dtrain = xgb.DMatrix(X_train, label=y_train)
    dtest = xgb.DMatrix(X_test, label=y_test)
    num_boost_round = 350

    params = {
    # Parameters that we are going to tune.
    'max_depth':10,
    'min_child_weight': 5.2475,
    'eta':0.0825,
    'gamma':0.03,
    'subsample': 0.85,
    'colsample_bytree': 0.8,
    'nthread': 8,
    'num_class': 9,
    # Other parameters
    'objective':'multi:softprob',
    'silent' : 1    }

    params['eval_metric'] = "mlogloss"


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
    model.save_model("xgboost_model_final.model")
    return model



def write_submission(preds, output):
    sample = pd.read_csv('sampleSubmission.csv')
    preds = pd.DataFrame(
        preds, index=sample.id.values, columns=sample.columns[1:])
    preds.to_csv(output, index_label='id')

def load_test():
    test = pd.read_csv('test.csv')
    test = test.drop('id', axis=1)
    return test.values

def load_train_data():
    train = pd.read_csv('train.csv')
    labels = train.target.values
    lbl_enc = preprocessing.LabelEncoder()
    labels = lbl_enc.fit_transform(labels)

    train = train.drop('id', axis=1)
    train = train.drop('target', axis=1)
    return train.values, labels.astype('int32')

X_metatrain, y = load_train_data()

X_FinalTest_XGBoost = xgb.DMatrix(X_metatrain)
model = xgb.Booster(model_file='xgboost_model.model')
Y_FinalTest_XGBoost1 = model.predict(X_FinalTest_XGBoost)
print "XBOOST1 done"
print Y_FinalTest_XGBoost1.shape

model = xgb.Booster(model_file='xgboost_model2.model')
Y_FinalTest_XGBoost2 = model.predict(X_FinalTest_XGBoost)
print "XBOOST2 done"

model = xgb.Booster(model_file='xgboost_model3.model')
Y_FinalTest_XGBoost3 = model.predict(X_FinalTest_XGBoost)
print "XBOOST3 done"

model = xgb.Booster(model_file='xgboost_model4.model')
Y_FinalTest_XGBoost4 = model.predict(X_FinalTest_XGBoost)
print "XBOOST4 done"

model = xgb.Booster(model_file='xgboost_model5.model')
Y_FinalTest_XGBoost5 = model.predict(X_FinalTest_XGBoost)
print "XBOOST5 done"

# load the model from disk
loaded_model = joblib.load('extra_model1.model')
y1 = loaded_model.predict(X_metatrain)
print "ExtraTrees done"

loaded_model = joblib.load('knn_model1.model')
y2 = loaded_model.predict(X_metatrain)
print "KNN1 done"


loaded_model = joblib.load('knn_model2.model')
y3 = loaded_model.predict(X_metatrain)
print "KNN2 done"

loaded_model = joblib.load('knn_model3.model')
y4 = loaded_model.predict(X_metatrain)
print "KNN3 done"

loaded_model = joblib.load('knn_model4.model')
y5 = loaded_model.predict(X_metatrain)
print "KNN4 done"

loaded_model = joblib.load('knn_model5.model')
y6 = loaded_model.predict(X_metatrain)
print "KNN5 done"

loaded_model = joblib.load('knn_model6.model')
y7 = loaded_model.predict(X_metatrain)
print "KNN6 done"

loaded_model = joblib.load('knn_model7.model')
y8 = loaded_model.predict(X_metatrain)
print "KNN7 done"

loaded_model = joblib.load('knn_model8.model')
y9 = loaded_model.predict(X_metatrain)
print "KNN8 done"

loaded_model = joblib.load('knn_model9.model')
y10 = loaded_model.predict(X_metatrain)
print "KNN9 done"

loaded_model = joblib.load('knn_model10.model')
y11 = loaded_model.predict(X_metatrain)
print "KNN10 done"

loaded_model = joblib.load('knn_model_euclidean1.model')
y12 = loaded_model.predict(X_metatrain)
print "KNN_euclidean1 done"

loaded_model = joblib.load('knn_model_euclidean2.model')
y13 = loaded_model.predict(X_metatrain)
print "KNN_euclidean2 done"

loaded_model = joblib.load('rf_model1.model')
y14 = loaded_model.predict(X_metatrain)
print "Random Forest1 done"
loaded_model = joblib.load('rf_model2.model')
y15 = loaded_model.predict(X_metatrain)
print "Random Forest2 done"

meta_train = np.array([y14, y15])
print meta_train.shape
meta_train = np.transpose(meta_train)


X_train, X_test, y_train, y_test = train_test_split(meta_train, y, test_size=0.2, random_state=1624)
model = xgboost_run(X_train, X_test, y_train, y_test)
# X_FinalTest = load_test()
# X_FinalTest = xgb.DMatrix(X_FinalTest)
# Y_FinalTest = model.predict(X_FinalTest)
# print Y_FinalTest.shape
# print Y_FinalTest_XGBoost1.shape
# Y_FINAL = np.mean([Y_FinalTest, Y_FinalTest_XGBoost1, Y_FinalTest_XGBoost2, Y_FinalTest_XGBoost3, Y_FinalTest_XGBoost4, Y_FinalTest_XGBoost5],axis=0)

# write_submission(Y_FINAL, 'submission6.csv')