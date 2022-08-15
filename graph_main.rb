require_relative 'graph'

social_network = Graph.new('Elena')
social_network.add_vertex('Elena', 'Sharon')
social_network.add_vertex('Sharon', 'Lucas')
social_network.add_vertex('Lucas', 'Laura')
social_network.add_vertex('Elena', 'Maria Sofia')
social_network.add_vertex('Laura', 'Rosendo')
social_network.print_nodes
