class Graph
  def initialize(node)
    @root = node
  end

  def dfs_collect
    seen = []
    stack = [root]

    while stack.length.positive?
      curr = stack.pop
      seen << curr unless seen.include?(curr)

      curr.edges.reverse_each do |child|
        stack.push(child) unless seen.include?(child)
      end
    end
    seen
  end

  def bfs_collect
    seen = []
    queue = [root]

    while queue.length.positive?
      curr = queue.shift
      seen << curr unless seen.include?(curr)

      curr.edges.each do |child|
        queue.push(child) unless seen.include?(child)
      end
    end
    seen
  end

  def leaf_nodes
    leaf_nodes = []
    dfs_collect.each do |n|
      leaf_nodes << n unless n.edges.length.positive?
    end
    leaf_nodes
  end

  attr_reader :root
end

class Node
  def initialize(value)
    @value = value
    @edges = []
  end

  def add_undirected_edge(node)
    edges.push(node)
    node.edges.push(self)
  end

  def add_directed_edge(node)
    edges.push(node)
  end

  def remove_directed_edges(node)
    edges.filter! { |n| n != node }
  end

  def remove_undirected_edges(node)
    edges.filter! { |n| n != node }
    node.filter! { |n| n != self }
  end

  def edge_of?(node)
    node.edges.include?(self)
  end

  attr_accessor :edges, :value
end

def dfs_collect(node)
  seen = []
  stack = [node]

  while stack.length.positive?
    curr = stack.pop
    seen << curr unless seen.include?(curr)

    curr.edges.reverse_each do |child|
      stack.push(child) unless seen.include?(child)
    end
  end
  seen
end

def bfs_collect(node)
  seen = []
  queue = [node]

  while queue.length.positive?
    curr = queue.shift
    seen << curr unless seen.include?(curr)

    curr.edges.each do |child|
      queue.push(child) unless seen.include?(child)
    end
  end
  seen
end

def get_leaf_nodes(node)
  leaf_nodes = []
  dfs_collect(node).each do |n|
    leaf_nodes << n unless n.edges.length.positive?
  end
  leaf_nodes
end

def get_vals(coll)
  coll.inject([]) { |acc, node| acc << node.value }
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)

node1.add_directed_edge(node2)
node1.add_directed_edge(node4)
node1.add_directed_edge(node3)

node2.add_directed_edge(node3)
node3.add_directed_edge(node4)

#   node1 = { value: 1, edges: [node2, node4, node3] }
#   node2 = { value: 2, edges: [node3] }
#   node3 = { value: 3, edges: [node4] }
#   node4 = { value: 4, edges: [] }

#   node1 = { value: 1, edges: [node4, node3] }
#   node2 = { value: 2, edges: [] }
#   node3 = { value: 3, edges: [] }
#   node4 = { value: 4, edges: [] }

graph = Graph.new(node1)
p get_vals(graph.dfs_collect)

#   dfs_collect(node1) === [1, 2, 3, 4]
#   bsf_collect(node1) ==== [1, 2, 4, 3]
#   get_leaf_nodes(node1) === [4]

node1.add_undirected_edge(node2)
node1.add_undirected_edge(node4)
node1.add_undirected_edge(node3)

node2.add_undirected_edge(node3)
node3.add_undirected_edge(node4)

#   node1 = { value: 1, edges: [node2, node4, node3] }
#   node2 = { value: 2, edges: [node1, node3] }
#   node3 = { value: 3, edges: [node1, node2, node4] }
#   node4 = { value: 4, edges: [node1, node3] }

#   dfs_collect(node1) === [1, 2, 3, 4]
#   bsf_collect(node1) ==== [1, 2, 4, 3]
#   get_leaf_nodes(node1) === []

[bfs_collect(node1), dfs_collect(node1), get_leaf_nodes(node1)].each { |coll| p get_vals(coll) }
