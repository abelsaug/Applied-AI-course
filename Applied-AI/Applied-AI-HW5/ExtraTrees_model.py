import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.metrics import log_loss
from sklearn import preprocessing, ensemble
from sklearn.externals import joblib

def load_train_data():
    train = pd.read_csv('train.csv')
    labels = train.target.values
    lbl_enc = preprocessing.LabelEncoder()
    labels = lbl_enc.fit_transform(labels)

    train = train.drop('id', axis=1)
    train = train.drop('target', axis=1)
    return train.values, labels.astype('int32')


def train_model_random_forest(train,labels):
    # train a random forest classifier
    model = ensemble.ExtraTreesClassifier(n_jobs=-1, n_estimators=1000)
    model.fit(train, labels)
    joblib.dump(model, 'extra_model1.model') 
    return model


X, y = load_train_data()
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=625)
model = train_model_random_forest(X_train,y_train)
preds = model.predict_proba(X_test)
print "MLogloss: ", log_loss(y_test, preds)