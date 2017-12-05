import pandas as pd


def load_train_data():
	train = pd.read_csv('train.csv')
	labels = train.Target.values
	return train, labels.astype('int32')

def decision_tree_learning(X,attr):
	if X.size == 0:
		print "There are no training examples to create a proper decision tree."
	elif not attr:
		print "Attributes are empty! The solution is characterized as the mode of all examples: ", X.mode()

X, y = load_train_data()
decision_tree_learning(X.values, list(X))
