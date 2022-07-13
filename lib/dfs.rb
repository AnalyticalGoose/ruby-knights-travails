require_relative 'variables.rb'
include Variables

knight = [1, 1]
target = [5, 6]

@arr = []
@solution = []

offset = [(knight[0]-target[0]).abs, (knight[1]-target[1]).abs]

@depth = MIN_MOVES[offset[0]][offset[1]]

def search(node, target_moves)

    depth = 1

    stack = calc_moves(node)
    if compare_stack(stack, target_moves).nil?
        test_node = stack.pop
        @solution << test_node
        depth += 1
end

def compare_stack(a, t)    
    return a.find{ |x| t.include?(x)}
end


def calc_moves(start, moves = [])
    8.times do |x = 0|
       test_move = [KXY[x][0] + start[0], KXY[x][1] + start[1]]
       x += 1
       test_move.any? { |n| n <= 0 || n >= 8} ? next : moves << test_move
    end
    moves
end

target_moves = calc_moves(target)
p search(knight, target_moves)




# Generate list of moves
# check array against target

# if target not in array, pop and append to solution, add 1 to depth and generate list of moves
# once at target depth, check array for match against target