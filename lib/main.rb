require 'matrix'
require_relative 'variables.rb'
include Variables

class Search
    def initialize(start, target)
        @start = start
        @target = target
        @solution = [@start]

        @offset = [(@start[0]-@target[0]).abs, (@start[1]-@target[1]).abs]
        p @min_moves = MIN_MOVES[@offset[0]][@offset[1]]
        
        @s_moves = available_moves(@start)
        @t_moves = available_moves(@target)

        solver(@s_moves, @t_moves, @min_moves)
        p "Solved in #{@min_moves} moves! :- #{@solution << @target}"
    end

    def available_moves(node, moves = [])
        8.times do |x = 0|
            test_move = [KXY[x][0] + node[0], KXY[x][1] + node[1]]
            test_move.any? { |n| n <= 0 || n >= 8} ? (x+=1) && next : (x+=1) && moves << test_move
        end
        moves
    end

    def next_moves(moves, n)
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
            s = next_moves(s, 1)
            solver(available_moves(@start), available_moves(t.find{s}), 2)
            @solution << t.find{s}
        end

        if min == 4
            s = next_moves(s, 1)
            t = next_moves(t, 1)
            match = (s.each{ |x| x[2]}.find{t.each{ |y| y[2]}}[2]).intersection(t.each{ |x| x[2]}.find{s.each{ |y| y[2]}}[2])[0]
            solver(available_moves(@start), available_moves(match), 2)
            @solution << match
            solver(available_moves(match), available_moves(@target), 2)
        end

        if min == 5
            solver(s, available_moves([4, 5]), 2)
            @solution << [4, 5]
            solver(available_moves([4, 5]), available_moves(t.find{s}), 2)
            @solution << t.find{s}
        end

        if min == 6
            SIX[@start.to_s].each{ |x| @solution << x}
        end
    end
end


search = Search.new([1, 8], [3, 6])
