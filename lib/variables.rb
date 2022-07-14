module Variables
    
    # Minimum number of moves to reach any square, this lookup is used to prevent over searching
    MIN_MOVES = [
        [0,3,2,3,2,3,4,5],
        [3,4,1,2,3,4,3,4],
        [2,1,4,3,2,3,4,5],
        [3,2,3,2,3,4,3,4],
        [2,3,2,3,4,3,4,5],
        [3,4,3,4,3,4,5,4],
        [4,3,4,3,4,5,4,5],
        [5,4,5,4,5,4,5,6]
        ]

    # 8 moves the knight can make
    KXY = [[-2,-1], [-1,-2], [1,-2], [2,-1] ,[-2,1] ,[-1,2] ,[1,2] ,[2,1]]


    # There are only 4 variations on a 6 move traversal. A lookup is far more efficient.
    SIX = {
        "[1, 8]" => [[3, 7], [5, 6], [4, 4], [5, 2], [7, 3]], 
        "[8, 8]" => [[6, 7], [4, 6], [5, 6], [4, 2], [2, 3]], 
        "[8, 1]" => [[7, 3], [5, 2], [4, 4], [5, 6], [3, 7]], 
        "[1, 1]" => [[2, 3], [4, 2], [5, 6], [4, 6], [6, 7]]
    }
end