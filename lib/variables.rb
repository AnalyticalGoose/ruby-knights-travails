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
    
    # Search steps required for knight and destination(backwards) to have a common square
    CALC_STEPS = [[0,0], [0,0], [0,0], [1,0], [3,1], [3,1], [4,1]]

    COORDS = [1, 2, 3, 4, 5, 6, 7, 8]
    BOARD_COORDS = COORDS.product(*[COORDS] * 1)

end