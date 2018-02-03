#15-Puzzle Solver

# Execution-time calculator
import random
import atexit
from time import clock
import Queue
import os
import copy
import sys

try:
  import psutil
except ImportError:
  print "Trying to Install required module: psutil\n"
  os.system('python -m pip install psutil')
# -- above lines try to install requests module if not present
# -- if all went well, import required module again ( for global access)
import psutil

#Methods for running time logging
#Formatting
def secondsToStr(t):
	return "%d:%02d:%02d.%03d" % \
	reduce(lambda ll,b : divmod(ll[0],b) + ll[1:],
		[(t*1000,),1000,60,60])

line = "="*40
def log(s, elapsed=None):
	print line
	print secondsToStr(clock()), '-', s
	if elapsed:
		print "Elapsed time:", elapsed
		#Displays memory usage	
		print "Memory Usage: ", process.memory_info()[0] / float(2 ** 20), "MB"
		print line
		print

def endlog():
	end = clock()
	elapsed = end-start
	log("End Program", secondsToStr(elapsed))

def now():
	return secondsToStr(clock())


#Global variables
solutionPath = Queue.LifoQueue()
depthBound = 0

# Random 15-puzzle creator
def createPuzzle():
	puzzleGrid = [[0 for x in range(4)] for y in range(4)]
	inputCh = (raw_input("Would you like to enter your own 15-puzzle (else it will be randomly generated) Ans: y/n  "))
	if inputCh == 'y': 
		# Entering your own puzzle
		for i in range(0,4):
			for j in range(0,4):
				while True:
					input_number = int(raw_input("Enter a number between 0 and 15. 0 is the blank space   "))
					if input_number > 15 or input_number < 0:
						print "That number does not satisfy requirements! Please enter again  "
					else:
						puzzleGrid[i][j] = input_number
						break

	else:
		# Random solvable/unsolvable puzzle generation
		puzzleList = range(1, 17) 
		random.shuffle(puzzleList)
		k=0
		for i in range(0,4):
			for j in range(0,4):
				puzzleGrid[i][j] = puzzleList[k]
				if puzzleGrid[i][j] == 16:
					puzzleGrid[i][j] = 0
				k+=1
	return puzzleGrid

# As blank tile is moved up
def up(puzzle, positionI, positionJ,expected_output):
	i= positionI
	j = positionJ
	temp = puzzle[i-1][j] 
	puzzle[i-1][j] = puzzle[i][j]
	puzzle[i][j]=temp

#Check if it is the expected output
	flag = 0				
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != expected_output[i][j]:
				flag = 1

	if flag == 0:	
		print "SUCCESS"
		print
		print
		# Print path
		print "PATH: "
		solutionList = []
		while not solutionPath.empty():
			solutionList.append(solutionPath.get())
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		return puzzle

# As blank tile is moved down
def down(puzzle, positionI, positionJ,expected_output):
	i= positionI
	j = positionJ
	temp = puzzle[i+1][j] 
	puzzle[i+1][j] = puzzle[i][j]
	puzzle[i][j]=temp

#Check if it is the expected output
	flag = 0				
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != expected_output[i][j]:
				flag = 1


	if flag == 0:	
		print "SUCCESS"
		print
		print
		# Print path
		print "PATH: "
		solutionList = []
		while not solutionPath.empty():
			solutionList.append(solutionPath.get())
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		return puzzle

# As blank tile is moved left
def left(puzzle, positionI, positionJ,expected_output):
	i= positionI
	j = positionJ
	temp = puzzle[i][j-1] 
	puzzle[i][j-1] = puzzle[i][j]
	puzzle[i][j]=temp

#Check if it is the expected output
	flag = 0				
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != expected_output[i][j]:
				flag = 1


	if flag == 0:	
		print "SUCCESS"
		print
		print
		# Print path
		print "PATH: "
		solutionList = []
		while not solutionPath.empty():
			solutionList.append(solutionPath.get())
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		return puzzle


# As blank tile is moved right
def right(puzzle, positionI, positionJ,expected_output):
	i= positionI
	j = positionJ
	temp = puzzle[i][j+1] 
	puzzle[i][j+1] = puzzle[i][j]
	puzzle[i][j]=temp

#Check if it is the expected output
	flag = 0				
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != expected_output[i][j]:
				flag = 1


	if flag == 0:	
		print "SUCCESS"
		print
		print
		# Print path
		print "PATH: "
		solutionList = []
		while not solutionPath.empty():
			solutionList.append(solutionPath.get())
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		return puzzle

#Check if repeated states are getting evaluated/searched
def checkRepeatedStates(q, value,nodeElement):

	flag0 = 0
	qList = list(q.queue)
	for node in qList:
		for i in range(0,4):
			for j in range(0,4):
				if node[i][j] != nodeElement[i][j]:
					flag0 = 1
					break
			if flag0 == 1:
				break	

		if flag0 == 0:
			value = True
			return	value
		else:
			value = False
	return value		


def dfs(nodeElement, q, currentDepth, expected_output):
	global depthBound
	currentDepth += 1
	if currentDepth <= depthBound:
		i = 0 
		positionI = 0
		positionJ = 0
		while 0 not in nodeElement[i]:
			i+=1
		positionJ = nodeElement[i].index(0)
		positionI = i
		value = False

		# Checks if you would like to quit search
		quitProgramQuestion1Flag = 0
		if (q.qsize() > 10000 and quitProgramQuestion1Flag == 0):
			print "It has iterated through 10000 nodes and has not found a solution."
			quitProgramQuestion1Flag = 1
			ch = (raw_input("Would you like to continue until next checkpoint? (y/n) "))
			if ch == 'n':
				print "Unfortunately the solution could not be found"
				exit()


		# Checks if you would like to quit search
		quitProgramQuestion2Flag = 1
		if q.qsize() > 50000 and quitProgramQuestion2Flag == 0:
			print "It has iterated through 50000 nodes and has not found a solution."
			quitProgramQuestion2Flag = 1
			ch = (raw_input("Would you like to continue? (y/n) "))
			if ch == 'n':
				print "Unfortunately the solution could not be found"
				exit()

		# Check if this state is a repeated state
		value = checkRepeatedStates(q,value,nodeElement)
		if value == True:
			return q

		q.put(copy.deepcopy(nodeElement))

		#Appending possible paths
		pathList = []
		if positionI != 0:
			pathList.append("UP")
		if positionI != 3:
			pathList.append("DOWN")
		if positionJ != 0:
			pathList.append("LEFT")
		if positionJ != 3:
			pathList.append("RIGHT")


		#Computing possible variation in children nodes and then going deeper in the exploration
		for path in pathList:
			if path == "UP":
				solutionPath.put("UP")
				puzzle = up(copy.deepcopy(nodeElement), positionI,positionJ,expected_output)
				if currentDepth != depthBound:
					q =	dfs(puzzle, q, currentDepth, expected_output)
				
				solutionPath.get()
			if path == "DOWN":
				solutionPath.put("DOWN")
				puzzle = down(copy.deepcopy(nodeElement), positionI,positionJ,expected_output) 	
				if currentDepth != depthBound:
					q =	dfs(puzzle, q, currentDepth, expected_output)
				solutionPath.get()

			if path == "LEFT":
				solutionPath.put("LEFT")
				puzzle = left(copy.deepcopy(nodeElement), positionI,positionJ,expected_output)
				if currentDepth != depthBound:
					q =	dfs(puzzle, q,  currentDepth, expected_output)

				solutionPath.get()

			if path == "RIGHT":
				solutionPath.put("RIGHT")
				puzzle = right(copy.deepcopy(nodeElement), positionI,positionJ,expected_output)
				if currentDepth != depthBound:
					q =	dfs(puzzle, q,  currentDepth, expected_output)
				solutionPath.get()
	q.get()
	return q

#IDS algorithm to try and solve the 15 puzzle
def iddfs(puzzle_input, expected_output):
	global depthBound
	q = Queue.LifoQueue()
	doWhileFlag = 0
	#Iteratively increases depthBound and runs DFS to that depthBound.
	while depthBound <= sys.maxsize:

		doWhileFlag = 1
		depthBound += 1
		print " DEPTH: ", depthBound 
		log("Elapsed Time: ", now())

		#Displays memory usage	
		print "Memory Usage: ", process.memory_info()[0] / float(2 ** 20), "MB"

		currentDepth = 0
		q = Queue.LifoQueue()
		q = dfs(puzzle_input, q, currentDepth, expected_output)

# Main function
if __name__ == '__main__':

	#Getting process for displaying memory usage
	process = psutil.Process(os.getpid())

	#puzzle Creation
	puzzle_input = createPuzzle()


	puzzle = [[0 for x in range(4)] for y in range(4)]
	for i in range(0,4):
		for j in range(0,4):
			puzzle[i][j] = puzzle_input[i][j]

	#Time Logging
	start = clock()
	atexit.register(endlog)
	log("Start Search")

	#Expected Output
	expected_output = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]
	#If input was a solved solution
	if puzzle_input == expected_output:
		print("The solved solution: {}", puzzle_input)
	else:
		iddfs(puzzle_input, expected_output)

	