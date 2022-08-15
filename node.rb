class Node
  attr_reader :data
  attr_accessor :adjacents

  def initialize(data)
    @data = data
    @adjacents = []
  end
end
