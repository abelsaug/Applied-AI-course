import pandas as pd
from  scipy import stats
from math import log

def load_train_data():
	train = pd.read_csv('train.csv')
	return train

class Tree(object):
	def __init__(self):
		self.left = None
		self.right = None
		self.data = None

def choose_best_attrs(attrs, X):
	best = attrs[0]
	currentMax = 0;
	for attribute in attrs:
		newMax = information_gain(attrs, X, attribute) 
		if newMax>currentMax:
			currentMax = newMax
			best = attribute
	return best

def entropy_probability(value):
	if value == 0 or value == 1:
		return 0
	entropy = - (value*log(value, 2)+ (1-value)*log(1-value,2))
	return entropy

def information_gain(attrs, X, attribute):
	p_bits = list(X.Target.values).count(1)
	n_bits = list(X.Target.values).count(0)
	proportion = float(p_bits)/(p_bits+n_bits)
	entropy_attrs = entropy_probability(proportion)
	entropy_rest = remainder(p_bits,n_bits,attrs, X, attribute)
	gain = entropy_attrs - entropy_rest
	return gain

def remainder(p_bits,n_bits,attrs, X, attribute):
	attribute_index = attrs.index(attribute)
	attribute_values = set(X.iloc[:,attribute_index])
	remainder = 0
	for value in attribute_values:
		value_X = X[X.iloc[:,attribute_index] == value]
		pk_bits = list(value_X.Target.values).count(1)
		nk_bits = list(value_X.Target.values).count(0)
		remainder += (pk_bits+nk_bits)/(p_bits+n_bits) * entropy_probability(float(pk_bits)/(pk_bits+nk_bits))
	return remainder


def decision_tree_learning(X,attrs, parent_examples):
	if X.size == 0:
		return stats.mode(parent_examples)[0]
	elif len(set(X.Target.values)) <= 1: 
		return X.Target.values[0]
	elif not attrs:
		return stats.mode(X)[0]
	else:
		best_attrs = choose_best_attrs(attrs,X)
		root = Tree()
		root.data = best_attrs
		best_attrs_index = attrs.index(best_attrs)
		unique_best_attrs_values = set(X.iloc[:,best_attrs_index])
		for value in unique_best_attrs_values:
			new_X = X[X.iloc[:,best_attrs_index] == value]
			subtree = decision_tree_learning(new_X, attrs.remove(best_attrs),stats.mode(X))
		return root


X = load_train_data()
decision = decision_tree_learning(X, list(X), X)
print decision