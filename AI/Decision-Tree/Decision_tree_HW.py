import pandas as pd
from  scipy import stats
from math import log
from scipy.stats import chi2
import copy

#Chisquare of probability 0.2  defined here
chiSquare = { 1:   1.64, 2: 3.22, 3: 4.64, 4:  5.99, 5: 7.29}

#loading training set
def load_train_data():
	train = pd.read_csv('train.csv')
	return train

#Tree definition
class Tree(object):
	def __init__(self):
		self.children = []
		self.branches = []
		self.data = None
	def __printTree__(self, parent, level = 0,index1 = 0):
		if level == 0:
			statement = "\t"*2+repr(self.data)+ "\n \n"
		else:
			statement = "\t"*level+ str(parent.branches[-1])+ "  " +repr(self.data)+"\n \n"
		iter1 = 0 
		prev_iter = 0
		for child in self.children:
			if type(child) is Tree:
				statement += child.__printTree__(self,level+iter1 ) 
				index1 +=1
			else:
				iter1 +=1
				statement += "\t"*(level+iter1)+ str(self.branches[index1])+ "  " +repr(child)
				index1 +=1
		return statement
	def __repr__(self):
		return '<tree node representation>'

#Function to choose best attributes
def choose_best_attrs(attrs, X):
	best = attrs[0]
	currentMax = 0;
	for attribute in attrs:
		newMax = information_gain(attrs, X, attribute) 
		if newMax>currentMax:
			currentMax = newMax
			best = attribute
	return best

#Calulcates entropy of a boolean variable that is true with probability 'value'
def entropy_probability(value):
	if value == 0 or value == 1:
		return 0
	entropy = - (value*log(value, 2)+ (1-value)*log(1-value,2))
	return entropy

# Calculates information gain from each attribute
def information_gain(attrs, X, attribute):
	p_bits = list(X.Target.values).count(1)
	n_bits = list(X.Target.values).count(0)
	proportion = float(p_bits)/(p_bits+n_bits)
	entropy_attrs = entropy_probability(proportion)
	entropy_rest = remainder(p_bits,n_bits,attrs, X, attribute)
	gain = float(entropy_attrs) - entropy_rest
	return gain

# Caulcating the expected entropy remaining after testing attribute
def remainder(p_bits,n_bits,attrs, X, attribute):
	attribute_index = attrs.index(attribute)
	attribute_values = set(X.iloc[:,attribute_index])
	remainder = 0
	for value in attribute_values:
		value_X = X[X.iloc[:,attribute_index] == value]
		pk_bits = list(value_X.Target.values).count(1)
		nk_bits = list(value_X.Target.values).count(0)
		remainder += (float(pk_bits)+nk_bits)/(p_bits+n_bits) * entropy_probability(float(pk_bits)/(pk_bits+nk_bits))
	return remainder

# Finds leaf nodes
def find_nodes(decision, nodes):
	flag = 0
	for child in decision.children:
		if type(child) is Tree:
			flag = 1
			nodes = find_nodes(child, nodes)
	if flag == 0:
		nodes.append(decision.data)
	return nodes

# Function that implements pruning
def prune(decision,X,attrs):
	bool =True
	p_bits = list(X.Target.values).count(1)
	n_bits = list(X.Target.values).count(0)
	while bool == True:
		nodes2 = []
		nodes2 = find_nodes(decision, nodes2)
		for node in nodes2:
			attribute_index = attrs.index(node)
			attribute_values = set(X.iloc[:,attribute_index])
			delta = calculate_delta(decision,X,attrs, p_bits, n_bits, attribute_index,attribute_values)
			items_in_distrubution = len(attribute_values)

			if delta<chiSquare[items_in_distrubution]:
				majority_value = find_majority_value(decision,X,attrs,decision)
				decision = replace_tree_node(decision,node,majority_value)
				if type(decision) is not Tree:
					return decision
			else:
				bool =False
	return decision

#Replaces the node while pruning with majority value
def replace_tree_node(decision,node,majority_value):
	flag = 0
	for child in decision.children:
		if type(child) is Tree:
			flag = 1
			index = decision.children.index(child)
			decision.children[index]  = replace_tree_node(child,node,majority_value)
			return decision

	if flag == 0:
		decision_value = majority_value
		return decision_value

#Calculating majority value for pruning
def find_majority_value(decision,X,attrs,parent):
	flag = 0
	new_tree= Tree()
	for child in decision.children:
		if type(child) is Tree:
			flag = 1
			return find_majority_value(child,X,attrs,decision)

	if flag == 0:
		no_of_false = 0
		no_of_truths = 0
		# count_of_mode_occurences = []

		for branch in decision.branches:
			attribute_index = attrs.index(decision.data)
			value_X = X[X.iloc[:,attribute_index] == branch]
			# print value_X
			# print branch 
			if stats.mode(value_X.Target.values)[0] == 0:
				no_of_false += stats.mode(value_X.Target.values)[1]
			if stats.mode(value_X.Target.values)[0] == 1:
				no_of_truths += stats.mode(value_X.Target.values)[1]

		if no_of_false>no_of_truths:
			return 0
		else:
			return 1

#Calculating delta/total deviation for pruning
def calculate_delta(tree, X, attrs, p_bits, n_bits, attribute_index,attribute_values):

		delta = 0
		for value in attribute_values:
			value_X = X[X.iloc[:,attribute_index] == value]
			pk_bits = list(value_X.Target.values).count(1)
			nk_bits = list(value_X.Target.values).count(0)

			pkcap = p_bits * (pk_bits+nk_bits)/(p_bits+n_bits)
			nkcap = n_bits * (pk_bits+nk_bits)/(p_bits+n_bits)

			delta += (pow(2, (pk_bits - pkcap)) / pkcap) + (pow(2, (nk_bits - nkcap)) / nkcap)
		return delta



# Base logic of decision tree learning
def decision_tree_learning(X,attrs, parent_examples):
	if X.size == 0:
		return stats.mode(parent_examples)[0]
	elif len(set(X.Target.values)) <= 1: 
		# print attrs, X, parent_examples
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
			attributes_copy = copy.deepcopy(attrs)
			attributes_copy.remove(best_attrs)
			root.branches.append(value)
			subtree = decision_tree_learning(new_X, attributes_copy,stats.mode(X))
			root.children.append(subtree)
		return root

# Main function stuff
X = load_train_data()
attrs = list(X)
attrs.remove('Target')
decision = decision_tree_learning(X, attrs, X)
print decision.__printTree__(decision)
print "\n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\nPruned\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
decision1 = prune(decision,X,attrs)
if type(decision1) is Tree:
	print decision1.__printTree__(decision)
else:
	print decision1
