#15-Puzzle Solver

# Execution-time calculator
import random
import atexit
from time import clock
import Queue
import os
import copy
import sys
from collections import namedtuple

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
	print
	print line
	print

def now():
	return secondsToStr(clock())


#Global variables
currentMaxDepth = 0
Node = namedtuple("Node", "puzzle f g h path parent depth")

# Random 15-puzzle creator
def createPuzzle():
	puzzleGrid = [[0 for x in range(4)] for y in range(4)]
	inputCh = (raw_input("Would you like to enter your own 15-puzzle (else it will be randomly generated) Ans: y/n  "))
	if inputCh == 'y': 
		# Entering your own puzzle
		for i in range(0,4):
			for j in range(0,4):
				while True:
					try:
						input_number = int(raw_input("Enter a number between 0 and 15. 0 is the blank space   "))
						if input_number > 15 or input_number < 0:
							print "That number does not satisfy requirements! Please enter again  "
						else:
							puzzleGrid[i][j] = input_number
							break
					except ValueError:
						print "That is not a number. Please enter again  "
					

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
def up(parentNode, explored, frontier, mhd, positionI, positionJ,expected_output):
	global currentMaxDepth
	i= positionI
	j = positionJ
	originalNode = parentNode
	puzzle = parentNode.puzzle
	g = parentNode.g
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
		solutionList.append("UP")
		while not originalNode.parent is None:
			solutionList.append(originalNode.path)
			originalNode = originalNode.parent
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		#Heuristic Check	
		if mhd == False:
			h = calculate_displaced_tiles(puzzle, expected_output)
		else:
			h = calculate_manhattan_distance(puzzle, expected_output)		
		g += 1 
		f = g + h
		depth = parentNode.depth + 1
		current_node = Node(puzzle, f, g, h, "UP", originalNode, depth)
		# Set Max Depth and print metrics
		if current_node.depth > currentMaxDepth:
			currentMaxDepth = current_node.depth
			print "DEPTH: ", currentMaxDepth
			log("Elapsed Time: ", now())
			

		# Check if this state is a repeated state
		value = checkRepeatedStates(explored,puzzle)
		if value == True:
			return 
		frontier.append(current_node)

	return 

# As blank tile is moved down
def down(parentNode, explored, frontier,  mhd, positionI, positionJ,expected_output):
	global currentMaxDepth
	i= positionI
	j = positionJ
	originalNode = parentNode
	puzzle = parentNode.puzzle
	g = parentNode.g
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
		solutionList.append("DOWN")
		while not originalNode.parent is None:
			solutionList.append(originalNode.path)
			originalNode = originalNode.parent
		solutionList.reverse()
		print solutionList	
		exit()
	else:
		#Heuristic Check		
		if mhd == False:
			h = calculate_displaced_tiles(puzzle, expected_output)
		else:
			h = calculate_manhattan_distance(puzzle, expected_output)		
		g += 1 
		f = g + h
		depth = parentNode.depth + 1
		current_node = Node(puzzle, f, g, h,"DOWN", originalNode, depth)
		# Set Max Depth and print metrics
		if current_node.depth > currentMaxDepth:
			currentMaxDepth = current_node.depth
			print "DEPTH: ", currentMaxDepth
			log("Elapsed Time: ", now())
			
		

		# Check if this state is a repeated state
		value = checkRepeatedStates(explored,puzzle)
		if value == True:
			return 
		frontier.append(current_node)

	return 

# As blank tile is moved left
def left(parentNode, explored, frontier, mhd,  positionI, positionJ,expected_output):
	global currentMaxDepth
	i= positionI
	j = positionJ
	originalNode = parentNode
	puzzle = parentNode.puzzle
	g = parentNode.g
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
		solutionList.append("LEFT")
		while not originalNode.parent is None:
			solutionList.append(originalNode.path)
			originalNode = originalNode.parent
		solutionList.reverse()
		print solutionList	
		exit()
	else:

		#Heuristic Check
		if mhd == False:
			h = calculate_displaced_tiles(puzzle, expected_output)
		else:
			h = calculate_manhattan_distance(puzzle, expected_output)		
		g += 1 
		f = g + h
		depth = parentNode.depth + 1		
		current_node = Node(puzzle, f, g, h,"LEFT", originalNode, depth)
		# Set Max Depth and print metrics
		if current_node.depth > currentMaxDepth:
			currentMaxDepth = current_node.depth
			print "DEPTH: ", currentMaxDepth
			log("Elapsed Time: ", now())
			

		# Check if this state is a repeated state
		value = checkRepeatedStates(explored,puzzle)
		if value == True:
			return 
		frontier.append(current_node)

	return 


# As blank tile is moved right
def right(parentNode, explored, frontier,  mhd, positionI, positionJ,expected_output):
	global currentMaxDepth	
	i= positionI
	j = positionJ
	originalNode = parentNode
	puzzle = parentNode.puzzle
	g = parentNode.g	
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
		solutionList.append("RIGHT")
		while not originalNode.parent is None:
			solutionList.append(originalNode.path)
			originalNode = originalNode.parent
		solutionList.reverse()
		print solutionList		
		exit()
	else:
		#Heuristic Check
		if mhd == False:
			h = calculate_displaced_tiles(puzzle, expected_output)
		else:
			h = calculate_manhattan_distance(puzzle, expected_output)		
		g += 1 
		f = g + h
		depth = parentNode.depth + 1		
		current_node = Node(puzzle, f, g, h, "RIGHT", originalNode, depth)
		# Set Max Depth and print metrics
		if current_node.depth > currentMaxDepth:
			currentMaxDepth = current_node.depth
			print "DEPTH: ", currentMaxDepth	
			log("Elapsed Time: ", now())
			
						

		# Check if this state is a repeated state
		value = checkRepeatedStates(explored,puzzle)
		if value == True:
			return 
		frontier.append(current_node)

	return 

#Check if repeated states are getting evaluated/searched
def checkRepeatedStates(explored, nodeElement):

	flag0 = 0
	value = False
	for node in explored:
		for i in range(0,4):
			for j in range(0,4):
				if node[i][j] != nodeElement[i][j]:
					flag0 = 1
					break
			if flag0 == 1:
				break	
		if flag0 == 1:
				break			

		if flag0 == 0:
			value = True
			return	value
		else:
			value = False
	return value		

# Heuristic 1: Calculate Displaced tiles
def calculate_displaced_tiles(puzzle, expected_output):

	displaced = 0
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != expected_output[i][j]:
				if puzzle[i][j] != 0:
						displaced +=1
	return displaced			

# Heuristic 2: Calculate Manhattan Distance
def calculate_manhattan_distance(puzzle, expected_output):

	manhattan_distance = 0
	for i in range(0,4):
		for j in range(0,4):
			if puzzle[i][j] != 0:

				expectedI = int((puzzle[i][j]-1)/4)
				expectedJ = int((puzzle[i][j] - 1)%4)
				manhattan_distance += abs(expectedI-i) + abs(expectedJ-j)
	
	return manhattan_distance		


def astar(puzzle_input, expected_output, mhd):
	
	frontier = []
	explored = []
	current_puzzle = puzzle_input

	#Heuristic Check
	if mhd == False:
		h = calculate_displaced_tiles(current_puzzle, expected_output)
	else:
		h = calculate_manhattan_distance(current_puzzle, expected_output)
	g = 0
	f = g + h
	current_node = Node(current_puzzle, f, g, h, None, None,0)
	frontier.append(current_node)

	#If input was a solved solution
	if current_puzzle == expected_output:
		print("The solved solution: {}", puzzle_input)
		print("Max Depth: ", 0)
		print("Time: ")
		print("Memory: ")
	else:	
		while frontier:
			current_puzzle = current_node.puzzle
			g = current_node.g
			try:
				# Moving to explored list
				frontier.remove(current_node)
				explored.append(current_node)
			except ValueError:
				print "Something has gone wrong."

			# currentDepth += 1
			i = 0 
			positionI = 0
			positionJ = 0
			while 0 not in current_puzzle[i]:
				i+=1
			positionJ = current_puzzle[i].index(0)
			positionI = i

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
					up(copy.deepcopy(current_node), explored, frontier, mhd, positionI,positionJ,expected_output)

				if path == "DOWN":
					down(copy.deepcopy(current_node), explored, frontier, mhd, positionI,positionJ,expected_output) 	

				if path == "LEFT":
					left(copy.deepcopy(current_node), explored, frontier, mhd, positionI,positionJ,expected_output)

				if path == "RIGHT":
					right(copy.deepcopy(current_node), explored, frontier, mhd, positionI,positionJ,expected_output)
			current_node = min(frontier, key = lambda t: t[1])
	print "NO SOLUTION FOUND! "

# Main function
if __name__ == '__main__':

	#Getting process for displaying memory usage
	process = psutil.Process(os.getpid())

	#puzzle Creation
	puzzle_input = createPuzzle()

	mhd = False 
	# Ask for Heuristic
	inputCh = (raw_input("Would you like to use Manhattan Distance heuristic (mhd) or Displaced Tile heuristic (dt) Ans: (mhd/dt)  "))
	if inputCh == 'mhd':
		mhd = True 
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
		astar(puzzle_input, expected_output,mhd)

	