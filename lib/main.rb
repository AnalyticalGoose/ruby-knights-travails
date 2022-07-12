require 'pry'

require_relative 'variables.rb'
include Variables

knight = [1, 1]
target = [4, 7]

#3,5 6,2

@solution = "#{knight} -> "


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
    moves
end

def knight_search(min_moves, moves)
     CALC_STEPS[min_moves][0].times do |x = 0|
        moves.size.times do |y = 0|
            moves[y] << calc_moves(moves[y])
            y += 1
        end   
        x+=1
    end
    moves
end

def find_common_cell(moves, t_moves)
    moves.size.times do |z = 0|
        t_moves.size.times do |x = 0|
            if (t_moves & moves[x][2]).one?
                @solution.concat("[#{moves[x][0]}, #{moves[x][1]}] -> ")
                return t_moves & moves[x][2]
            end
            x += 1
        end
        z += 1
    end
end

moves = knight_search(min_moves, calc_moves(knight, moves))
t_moves = calc_moves(target, t_moves).map { |i| i }
@solution.concat("#{find_common_cell(moves, t_moves)} -> #{target}")

puts @solution
