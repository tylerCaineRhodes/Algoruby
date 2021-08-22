# node which represents a transaction or a current state of ownership

class Node
  def initialize(uuid)
    @uuid = uuid
    @conveyances = []
  end

  def add_conveyance(node)
    raise DuplicateNodeError.new(node) if conveyance_of?(node)

    conveyances.push(node)
  end

  def remove_conveyances(node)
    conveyances.filter! { |n| n != node }
  end

  def conveyance_of?(node)
    node.conveyances.include?(self)
  end

  attr_accessor :conveyances, :uuid
end

class Calculator
  def initialize(node)
    @first_conveyance = node
  end

  def dfs_collect
    seen = []
    stack = [first_conveyance]

    while stack.length.positive?
      curr = stack.pop
      seen << curr unless seen.include?(curr)

      curr.conveyances.reverse_each do |child|
        stack.push(child) unless seen.include?(child)
      end
    end
    seen
  end

  def bfs_collect
    seen = []
    queue = [first_conveyance]

    while queue.length.positive?
      curr = queue.shift
      seen << curr

      curr.conveyances.each do |child|
        queue.push(child) unless seen.include?(child)
      end
    end
    seen
  end

  def leaf_nodes
    leaf_nodes = []
    dfs_collect.each do |n|
      leaf_nodes << n unless n.conveyances.length.positive?
    end
    leaf_nodes
  end

  # can do all calculations in a traversal function from the calculator class
  def find_current_title
    # traverser through the tree and aggretate the output
  end

  attr_reader :first_conveyance
end

def get_vals(coll)
  coll.inject([]) { |acc, node| acc << node.uuid }
end

class DuplicateNodeError < RuntimeError
  attr_reader :node

  def initialize(
    node,
    msg = 'Adding a node already contained in the graph will create a cycle. Create a new node per transaction'
  )
    @node = node
    super(msg)
  end
end

first_conveyance = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)

first_conveyance.add_conveyance(node2)
first_conveyance.add_conveyance(node3)
first_conveyance.add_conveyance(node4)

calculator = Calculator.new(first_conveyance)
p get_vals(calculator.dfs_collect)
