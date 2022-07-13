require_relative 'variables.rb'
include Variables

knight = [1, 1]
target = [7, 7]

# knight = [1, 8]
# target = [1, 3]

offset = [(knight[0]-target[0]).abs, (knight[1]-target[1]).abs]
min_moves = MIN_MOVES[offset[0]][offset[1]]

moves = []
target_moves = []
@solution = []

def calc_moves(start, moves = [])
    8.times do |x = 0|
       test_move = [KXY[x][0] + start[0], KXY[x][1] + start[1]]
       x += 1
       test_move.any? { |n| n <= 0 || n >= 8} ? next : moves << test_move
    end
    moves
end

def knight_search(moves, n)
    n.times do |x = 0|
       moves.size.times do |y = 0|
           moves[y] << calc_moves(moves[y])
           y += 1
        #    CALC_STEPS[min_moves][0]
       end   
       x+=1
   end
   moves
end

def find_common_cell(m, t, min_moves)
    return m.find{ |x| t.include?(x)} if min_moves == 2

    if min_moves == 3
        2.times do | n = 0|
            if array_match(n, m, t) == false
                @solution << m[n][2].find{ |x| t.include?(x)} && @solution.unshift(m[n][0..1])
                break
            end
                n += 1
        end
    end

    if min_moves == 4
        return (m[0][2] & t[0][2]) & (m[0][2] & t[1][2]) & (m[1][2] & t[0][2]) & (m[1][2] & t[1][2])
    end
end


def array_match(n, moves, target_moves)
    return moves[n][2].find{ |x| target_moves.include?(x)}.nil?
end


k_1 = calc_moves(knight)
k_2 = knight_search(k_1, 1)

t_1 = calc_moves(target)
t_2 = knight_search(t_1, 1)

@solution << find_common_cell(k_2, t_2, min_moves).flatten

p @solution