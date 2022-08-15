require_relative 'node'

class Graph
  attr_reader :root

  def initialize(value)
    @root = Node.new(value)
  end

  def add_vertex(node_value, new_value)
    node = find(node_value)
    return if node.nil?
    return if node.adjacents.map(&:data).include?(new_value)

    new_node = find(new_value) || Node.new(new_value)
    node.adjacents << new_node
    new_node.adjacents << node
  end

  def find(value)
    dfs { |node| break node if node.data == value }
  end

  def print_nodes
    dfs { |node| puts "#{node.data} -> #{node.adjacents.map(&:data)}" }
  end

  def shortest_path(source, target)
    path_list = bfs_ptp(source, target)
    travel_path = [target.data]
    curr_pos = target.data
    until curr_pos == source.data
      travel_path.unshift(path_list[curr_pos])
      curr_pos = path_list[curr_pos]
    end
    travel_path
  end

  private
  def dfs(curr_node = @root, node_stack = [], visited = [], &block)
    return if curr_node.nil?

    visitable_adjacents = curr_node.adjacents - visited
    unless visited.include?(curr_node)
      block.call(curr_node) if block_given?
      node_stack.unshift(curr_node)
      visited << curr_node
    end
    if visitable_adjacents.empty?
      node_stack.shift
      return dfs(node_stack[0], node_stack, visited, &block)
    end
    dfs(visitable_adjacents[0], node_stack, visited, &block)
  end

  def bfs_ptp(source, target, queue = [], path = { source.data => [] })
    source.adjacents.each { |neighboor| queue.unshift([source, neighboor]) unless path[neighboor.data] }
    vertex_info = queue.pop
    path[vertex_info[1].data] = vertex_info[0].data unless path[vertex_info[1].data]
    return path if path[target.data] || queue.empty?

    bfs_ptp(vertex_info[1], target, queue, path)
  end
end
