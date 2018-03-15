"""
Implementation of k-nearest-neighbor classifier
"""

from numpy import *
from pylab import *

from binary import *


class KNN(BinaryClassifier):
    """
    This class defines a nearest neighbor classifier, that support
    _both_ K-nearest neighbors _and_ epsilon ball neighbors.
    """

    def __init__(self, opts):
        """
        Initialize the classifier.  There's actually basically nothing
        to do here since nearest neighbors do not really train.
        """

        # remember the options
        self.opts = opts

        # just call reset
        self.reset()

    def reset(self):
        self.trX = zeros((0,0))    # where we will store the training examples
        self.trY = zeros((0))      # where we will store the training labels

    def online(self):
        """
        We're not online
        """
        return False

    def __repr__(self):
        """
        Return a string representation of the tree
        """
        return    "w=" + repr(self.weights)

    def loadDigitData(filename, maxExamples=100000):
        h = open(filename, 'r')
        D = []
        for l in h.readlines():
            a = l.split()
            if len(a) > 1:
                y = float(a[0])
                if y > 0.5: y = 1.
                else: y = -1.
                x = {}
                for i in range(1, len(a)):
                    v = float(a[i]) / 255.
                    if v > 0.:
                        x[i] = v
                D.append( (x,y) )
                if len(D) >= maxExamples:
                    break
        h.close()
        return D

    def exampleDistance(x1, x2):
        dist = 0.
        for i,v1 in x1.items():
            v2 = 0.
            if i in x2: v2 = x2[i]
            dist += (v1 - v2) * (v1 - v2)
        for i,v2 in x2.items():
            if not i in x1:
                dist += v2 * v2
        return sqrt(dist)


    def predict(self, X):
        """
        X is a vector that we're supposed to make a prediction about.
        Our return value should be the 'vote' in favor of a positive
        or negative label.  In particular, if, in our neighbor set,
        there are 5 positive training examples and 2 negative
        examples, we return 5-2=3.

        Everything should be in terms of _Euclidean distance_, NOT
        squared Euclidean distance or anything more exotic.
        """

        isKNN = self.opts['isKNN']     # true for KNN, false for epsilon balls
        N     = self.trX.shape[0]      # number of training examples

        if self.trY.size == 0:
            return 0                   # if we haven't trained yet, return 0
        elif isKNN:
            # this is a K nearest neighbor model
            # hint: look at the 'argsort' function in numpy
            K = self.opts['K']         # how many NN to use

            val = 0                    # this is our return value: #pos - #neg of the K nearest neighbors of X
            pos = 0
            neg = 0
            distanceArray = []
            for trXvalues in self.trX:
                distance = 0
                distanceSquared = 0
                i = 0
                for Xvalues in X:
                    distanceSquared += np.power((trXvalues[i] - Xvalues),2)
                    i+=1
                distance = np.sqrt(distanceSquared)
                distanceArray.append(distance)
            sortedDistanceIndex = np.argsort(distanceArray)
            for neighbours in range(0,K):
                if len(self.trY) > neighbours:
                    if self.trY[sortedDistanceIndex[neighbours]] <= 0:
                        neg += 1
                    else:
                        pos +=1
            val = pos - neg
            return val
        else:
            # this is an epsilon ball model
            eps = self.opts['eps']     # how big is our epsilon ball

            val = 0                    # this is our return value: #pos - #neg within and epsilon ball of X
            ### TODO: YOUR CODE HERE
            util.raiseNotDefined()
            return val
                
            


    def getRepresentation(self):
        """
        Return the weights
        """
        return (self.trX, self.trY)

    def train(self, X, Y):
        """
        Just store the data.
        """
        self.trX = X
        self.trY = Y
        
