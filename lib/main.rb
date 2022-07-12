require_relative 'variables.rb'
include Variables

knight = [1, 1]
target = [4, 7]





# Calculate the X,Y offset from the knight to its target
offset = [(knight[0]-target[0]).abs, (knight[1]-target[1]).abs]
# Lookup the offset to find the minimum number of expected moves
min_moves = MIN_MOVES[offset[0]][offset[1]]

moves = []
t_moves = []

def calc_moves(start, moves = [])
    8.times do |x = 0|
       test_move = [KXY[x][0] + start[0], KXY[x][1] + start[1]]
       x += 1
       test_move.any? { |n| n <= 0 || n >= 8} ? next : moves << test_move
    end
end

def knight_search(min_moves, moves)
    depth = CALC_STEPS[min_moves][0]
end

def target_search

end

calc_moves(knight, moves)
p moves

calc_moves(target, t_moves)
p t_moves
