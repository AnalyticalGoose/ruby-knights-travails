require 'matrix'
require_relative 'variables.rb'
include Variables

class Search
    def initialize(start, target)
        @start = start
        @target = target
        @solution = [@start]

        @offset = [(@start[0]-@target[0]).abs, (@start[1]-@target[1]).abs]
        @min_moves = MIN_MOVES[@offset[0]][@offset[1]]
        
        @s_moves = available_moves(@start)
        @t_moves = available_moves(@target)

        solver(@s_moves, @t_moves, @min_moves)
        p @solution << @target
    end

    def available_moves(node, moves = [])
        8.times do |x = 0|
            test_move = [KXY[x][0] + node[0], KXY[x][1] + node[1]]
            test_move.any? { |n| n <= 0 || n >= 8} ? (x+=1) && next : (x+=1) && moves << test_move
        end
        moves
    end

    def next_moves(moves, n = CALC_STEPS[@min_moves][0])
        n.times do |x = 0|
            moves.size.times do |y = 0|
                moves[y] << available_moves(moves[y])
                y += 1
            end
            x += 1
        end
        moves
    end

    def solver(s, t, min)
        min == 2 ? @solution << s.find{ |x| t.include?(x)} : nil

        if min == 3
            s = next_moves(s)
            Matrix[s[0][2]].any?(t.find{s}) == true ? @solution << s[0][0..1] : @solution << s[1][0..1]
            @solution << t.find{s}
        end
    end

end

search = Search.new([1, 1], [2, 7])
