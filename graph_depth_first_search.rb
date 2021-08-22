class Node
  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(name)
    children << Node.new(name)
  end

  def depth_first_search(visited = [])
    visited << name

    children.each { |child| child.depth_first_search(visited) }
    visited
  end

  def breadth_first_search(array = [])
    queue = [this]

    while queue.length.positive?
      curr = queue.shift
      array << curr.name
      curr.children.each { |child| queue << child }
    end
    array
  end

  attr_accessor :name, :children
end
