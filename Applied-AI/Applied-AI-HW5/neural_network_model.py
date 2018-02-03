#Neural network models


# coding: utf-8



import numpy as np
import pandas as pd
import tensorflow
import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import KFold
from sklearn.preprocessing import MinMaxScaler
from sklearn.cross_validation import train_test_split
from sklearn.metrics import log_loss
from sklearn import preprocessing
from keras.layers.normalization import BatchNormalization
from keras.optimizers import SGD,Adagrad, Adam




def load_train_data():
    train = pd.read_csv('train.csv')
    labels = train.target.values
    lbl_enc = preprocessing.LabelEncoder()
    labels = lbl_enc.fit_transform(labels)

    train = train.drop('id', axis=1)
    train = train.drop('target', axis=1)
    return train.values, labels.astype('int32')








def write_submission(preds, output):
    sample = pd.read_csv('sampleSubmission.csv')
    preds = pd.DataFrame(
        preds, index=sample.id.values, columns=sample.columns[1:])
    preds.to_csv(output, index_label='id')

def load_test():
    test = pd.read_csv('test.csv')
    test = test.drop('id', axis=1)
    return test.values



X, y = load_train_data()
scaler = MinMaxScaler() #Tested with and without
X = scaler.fit_transform(X)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=123)
X_FinalTest = load_test()





model = Sequential()
#Input layer
model.add(Dense(93, input_dim=93, kernel_initializer='normal', activation='relu')) #Tested with Neurons: 100,93: PRELU activation, RELU Activation
model.add(Dropout(0.13)) #Tested with: 0.0, 0.1, 0.13
model.add(BatchNormalization()) # with and without


#Hidden Layers
model.add(Dense(2500, kernel_initializer='normal', activation='relu')) # Tested with Neurons:2400,2500, 2000: PRELU activation, RELU Activation
model.add(Dropout(0.77)) #Tested with: 0.0, 0.6, 0.7, 0.77
model.add(BatchNormalization()) # with and without

model.add(Dense(1300, kernel_initializer='normal', activation='relu')) #Tested with Neurons: 1000, 1500, 1024, 1300: PRELU activation, RELU Activation
model.add(Dropout(0.35)) #Tested with: 0.0, 0.3, 0.35
model.add(BatchNormalization()) #Tested with and without

model.add(Dense(50, kernel_initializer='normal', activation='relu')) #40,400,170, 50
model.add(Dropout(0.15)) #Tested with: 0.0, 0.1, 0.15
model.add(BatchNormalization()) # with and without


#Output Layer
model.add(Dense(9, kernel_initializer='normal'))

# Tested with:
# Adagrad(lr=0.01, epsilon=1e-08, decay=0.0)
# Adagrad(lr=0.04, epsilon=1e-08, decay=0.0)
# Adagrad(lr=0.04, epsilon=1e-08, decay=0.0001)
adg = Adagrad(lr=0.04, epsilon=1e-08, decay=0.00001)
# SGD(lr=0.01, momentum=0.0, decay=0.0, nesterov=False)
# SGD(lr=0.04, momentum=0.0, decay=0.001, nesterov=False)
# sgd = SGD(lr=0.04, decay=1e-6, momentum=0.9, nesterov=True)
# Adam(lr=0.001, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=0.0)
# adam = Adam(lr=0.1, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=0.001)
# adam = Adam(lr=0.04, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=0.00001)


model.compile(loss='sparse_categorical_crossentropy', optimizer=adg)





# modeldata = model.fit(x_train, y_train, epochs=50, batch_size=50)
# model.save("model_1.h5")





#from keras.models import load_model
#model = load_model('model_3.h5')





# results = model.evaluate(X_test, y_test, verbose=1)






kfold = KFold(n_splits=5, shuffle=True, random_state=123)
for train, test in kfold.split(X, y):
    model.fit(X[train], y[train], epochs=15, batch_size=64) # epoch 600, 300, 20 batch_size = 32, 1024, 512, 64
    results = model.evaluate(X[test], y[test])
model.save("model_1_improved.h5")






y_pred = model.predict(x_test)
print("log_loss: ", log_loss(y_test, y_pred))
Y_FinalTest = model.predict(X_FinalTest)
write_submission(Y_FinalTest, 'submission1_nn.csv')


