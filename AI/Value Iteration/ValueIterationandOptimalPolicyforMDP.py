import copy

# Calculates the product of the transition model and utility of the various states and actions
def actions(Ugrid,row,col):
    pslist = []
    acts = ["UP","DOWN","LEFT","RIGHT"]
    for act in acts:
        ps = 0
        if act == "UP":
            if row - 1 >= 0 and (row-1 != wall[0] or col != wall[1]):
                ps = ps + 0.8* Ugrid[row-1][col] 
            else:
                ps = ps + 0.8* Ugrid[row][col]    

            if col - 1 >= 0 and (row != wall[0] or col-1 != wall[1]):
                ps = ps + 0.1* Ugrid[row][col-1] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            if col + 1 < len(Ugrid[row]) and (row != wall[0] or col+1 != wall[1]):
                ps = ps + 0.1* Ugrid[row][col+1] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            pslist.append(ps)

        if act == "DOWN":
            if row + 1 < len(Ugrid) and (row+1 != wall[0] or col != wall[1]):
                ps = ps + 0.8* Ugrid[row+1][col] 
            else:
                ps = ps + 0.8* Ugrid[row][col]    

            if col - 1 >= 0  and (row != wall[0] or col-1 != wall[1]):
                ps = ps + 0.1* Ugrid[row][col-1] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            if col + 1 < len(Ugrid[row]) and (row != wall[0] or col+1 != wall[1]):
                ps = ps + 0.1* Ugrid[row][col+1] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            pslist.append(ps)

        if act == "LEFT":
            if row - 1 >= 0 and  (row-1 != wall[0] or col != wall[1]):
                ps = ps + 0.1* Ugrid[row-1][col] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            if col - 1 >= 0  and (row != wall[0] or col-1 != wall[1]):
                ps = ps + 0.8* Ugrid[row][col-1] 
            else:
                ps = ps + 0.8* Ugrid[row][col]    

            if row + 1 < len(Ugrid) and  (row+1 != wall[0] or col != wall[1]):
                ps = ps + 0.1* Ugrid[row+1][col] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            pslist.append(ps)
          
        if act == "RIGHT":
            if row - 1 >= 0 and (row-1 != wall[0] or col != wall[1]):
                ps = ps + 0.1* Ugrid[row-1][col] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            if col + 1 < len(Ugrid[row])  and (row != wall[0] or col+1 != wall[1]):
                ps = ps + 0.8* Ugrid[row][col+1] 
            else:
                ps = ps + 0.8* Ugrid[row][col]    

            if row + 1 < len(Ugrid)  and (row+1 != wall[0] or col != wall[1]):
                ps = ps + 0.1* Ugrid[row+1][col] 
            else:
                ps = ps + 0.1* Ugrid[row][col]    

            pslist.append(ps)
    return pslist

# Performs Value Iteration to get the utility states
def valueIteration(Ugrid,U1grid,gamma,E,R,wall,postiveRewardTerminal,negativeRewardTerminal):
    while True:
        Ugrid=copy.deepcopy(U1grid)
        delta=0
        pathList = [[0 for x in range(len(Ugrid[0]))] for y in range(len(Ugrid))] 
        for row in range(0,len(Ugrid)):
            for col in  range(0,len(Ugrid[0])):

                #Handles terminal and exception cases
                if row == postiveRewardTerminal[0] and col == postiveRewardTerminal[1]:
                    continue
                if row == negativeRewardTerminal[0] and col == negativeRewardTerminal[1]:
                    continue    
                if row == wall[0] and col == wall[1]:
                    continue    

                actionList = actions(Ugrid,row,col)    
                maxValue = max(actionList)
                maxIndex = actionList.index(maxValue) # Finds index of max value thus providing us with the action taken
                pathList[row][col] = maxIndex
                U1grid[row][col] = R[row][col] + gamma * maxValue
                if abs(U1grid[row][col]-Ugrid[row][col]) > delta:
                    delta = abs(U1grid[row][col]-Ugrid[row][col]) # Recalculating delta
        if delta < (E * (1-gamma)/gamma): # Termination condition
            break
    return Ugrid,pathList   
    
# Converts the list to easily readable format. X = Wall, P = Positive Reward Exit, N = Negative Reward Exit
def prettyUpthePathList(pathList, postiveRewardTerminal, negativeRewardTerminal, wall):
    
    for i in range(0,len(pathList)):
        for j in range(0,len(pathList[0])):
            if i == postiveRewardTerminal[0] and j == postiveRewardTerminal[1]:
                pathList[i][j] = "P"
            if i == negativeRewardTerminal[0] and j == negativeRewardTerminal[1]:
                pathList[i][j] = "N"
            if i == wall[0] and j == wall[1]:
                pathList[i][j] = "X"
            if pathList[i][j] == 0:
                pathList[i][j] = "UP"
            if pathList[i][j] == 1:
                pathList[i][j] = "DOWN" 
            if pathList[i][j] == 2:
                pathList[i][j] = "LEFT"
            if pathList[i][j] == 3:
                pathList[i][j] = "RIGHT"      
    return pathList  

# Main function
if __name__ == '__main__':

    # Input Values
    Ugrid = [[0 for x in range(4)] for y in range(3)]
    R = [[-0.04 for x in range(4)] for y in range(3)]
    wall = [1,1]
    E = 0.0001 
    postiveRewardTerminal = [0,3]
    negativeRewardTerminal = [1,3]
    Ugrid[postiveRewardTerminal[0]][postiveRewardTerminal[1]] = 1
    Ugrid[negativeRewardTerminal[0]][negativeRewardTerminal[1]] = -1
    gamma = 0.9999999
    
    Ugrid[wall[0]][wall[1]] = None
    U1grid = copy.deepcopy(Ugrid)

    # Performs Value Iteration and returns utility states and the path list
    utilityStates, pathList = valueIteration(Ugrid,U1grid,gamma,E,R,wall,postiveRewardTerminal,negativeRewardTerminal)
    print utilityStates

    # Converts the list to easily readable format. X = Wall, P = Positive Reward Exit, N = Negative Reward Exit
    pathList = prettyUpthePathList(pathList, postiveRewardTerminal, negativeRewardTerminal, wall)
    print pathList


           