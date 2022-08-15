require_relative 'knight'
require_relative 'graph'

def construct_path(board, knight, moves_network, constructed_moves = [])
  posible_moves = knight.moves.select { |move| move.all? { |pos| pos.between?(0, board.length - 1) } }
  origin = knight.pos
  constructed_moves << origin
  posible_moves.each do |move|
    moves_network.add_vertex(origin, move)
    knight.pos = move
    construct_path(board, knight, moves_network, constructed_moves) unless constructed_moves.include?(move)
  end
end

board = Array.new(8) { Array.new(8) }
knight = Knight.new
moves_network = Graph.new(knight.pos)
construct_path(board, knight, moves_network)
initial_pos = moves_network.find([0, 0])
ending_pos = moves_network.find([0, 7])
p(moves_network.shortest_path(initial_pos, ending_pos))
