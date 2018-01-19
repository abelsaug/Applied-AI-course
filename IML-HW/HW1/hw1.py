import numpy as np

# Question 1(a)
def prime_nums_reversed(n):
    '''
        Write a function nums_reversed that takes in an integer n and returns a string containing all prime numbers between 1 and n in reverse order, separated by spaces. For example:
            >>> prime_nums_reversed(5)
            '5 3 2 1'
        Note: The ellipsis (...) indicates something you should fill in. It doesn't necessarily imply you should replace it with only one line of code.
    '''

    # PUT YOUR CODE HERE
    pass    # remove the 'pass'


# Question 1(b)
def string_explosion(string):
    '''
        Write a function string_explosion that takes in a non-empty string like "Code" and returns a long string containing every suffix of the input. For example:
        >>> string_explosion('Code')
        'Codeodedee'
        >>> string_explosion('data!')
        'data!ata!ta!a!!'
        >>> string_explosion('hi')
        'hii'

        Hint: Try to use recursion.
    '''

    # PUT YOUR CODE HERE
    pass    # remove the 'pass'


# Question 1(c)
def consecutive(nums):
    '''
        Write a function consecutive that takes in a list of integers and returns True only if the list has two numbers whose difference is 1 next to each other (i.e., n and n+1).

        >>> consecutive([50, 34, 3, 15])
        False
        >>> consecutive([7, 3, 20, 21, 8])
        True
    '''

    # PUT YOUR CODE HERE
    pass    # remove the 'pass'


# Question 2(a)
def bowl_cost(v):
    '''
        v is the price vector
        it can take any value like this: np.array([1,3,5])

        The store sells the following fruit bowls:

            #1: 3 of each fruit
            #2: 2 mangos and 8 apricots
            #3: 5 strawberries and 3 apricots
            #4: 10 apricots

        Create a 2-dimensional numpy array encoding the matrix B such that the matrix-vector multiplication
            B x v
        evaluates to a length 4 column vector containing the price of each fruit bowl. 
        The first entry of the result should be the cost of fruit bowl #1, the second entry the cost of fruit bowl #2, etc.
    '''

    B = np.array([
        # You should fill this in.
    ])

    # The notation B @ v means: compute the matrix multiplication Bv
    return B @ v


# Question 2(b)
def amount_spent(v, B):
    '''
        v and B are from the previous question (2a).

        Bob, Daniela, and Luke make the following purchases:

        * Bob buys 2 fruit bowl #1's and 1 fruit bowl #3.
        * Daniela buys 1 of each fruit bowl.
        * Luke buys 10 fruit bowl #4s (he really likes apricots).

        Create a matrix A such that the matrix expression
            A x B x v
        evaluates to a length 3 column vector containing how much each of them spent. 
        The first entry of the result should be the total amount spent by Bob, the second entry the amount sent by Daniela, etc.
    '''

    A = np.array([
        [2, 0, 1, 0]
    ]) # Finish this!

    return A @ B @ v


# Question 2(c)
def new_price(A, B, x):
    '''
        A and B are from previous question (2b).

        Let's suppose Berkeley Bowl changes their fruit prices, but you don't know what they changed their prices to. 
        Joey, Deb, and Sam buy the same quantity of fruit baskets and the number of fruit in each basket is the same, 
        but now the amount they spent is given by 'x':

        Use np.linalg.inv and x to compute the new prices for the individual fruits:
    '''

    new_v = None    # Fill your code here
    return new_v