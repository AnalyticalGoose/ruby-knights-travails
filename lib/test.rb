require_relative 'variables.rb'
include Variables

@knight = [3, 5]
@target = [6, 2]

Moves = Struct.new(:node, :children)

def calc_moves(start, moves = [])
    8.times do |x = 0|
       test_move = [KXY[x][0] + start[0], KXY[x][1] + start[1]]
       x += 1
       test_move.any? { |n| n <= 0 || n >= 8} ? next : moves << test_move
    end
    moves
end

p @root = Moves.new(@knight, calc_moves(@knight))
