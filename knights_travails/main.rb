require_relative 'node'
require_relative 'board'
# this is the tester

board = Board.new
initial = [rand(1..8), rand(1..8)]
destination = [rand(1..8), rand(1..8)]
board.knight_moves(initial, destination)