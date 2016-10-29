class Node
  attr_accessor :id, :parent, :left, :right

  def initialize(id, parent)
    @id = id
    @parent = parent
    @left = -1
    @right = -1
  end

  def preorder
    print " #{@id}"
    @left.preorder  unless @left  == -1
    @right.preorder unless @right == -1
  end

  def inorder
    @left.inorder  unless @left  == -1
    print " #{@id}"
    @right.inorder unless @right == -1
  end

  def postorder
    @left.postorder  unless @left  == -1
    @right.postorder unless @right == -1
    print " #{@id}"
  end
end

ID = 0
LEFT = 1
RIGHT = 2

num_of_nodes = STDIN.gets.to_i
nodes_input = STDIN.read.split("\n")
tree = Array.new(num_of_nodes,nil)

nodes_input.each do |line|
  node = line.split(" ").map{ |i| i.to_i }
  if tree[node[ID]].nil?
    # 初登場ノード ( とりあえず root として生成 )
    tree[node[ID]]=Node.new(node[ID], -1)
  end

  # 左右のノードを生成
  if node[LEFT]>-1
    if tree[node[LEFT]].nil?
      # 初登場ノード ( とりあえず leaf として生成 )
      tree[node[LEFT]] = Node.new(node[LEFT], tree[node[ID]])
    else
      # 既に存在する(子がいる)ノード
      tree[node[LEFT]].parent = tree[node[ID]]
    end
  end
  if node[RIGHT]>-1
    if tree[node[RIGHT]].nil?
      # 初登場ノード ( とりあえず leaf として生成 )
      tree[node[RIGHT]] = Node.new(node[RIGHT], tree[node[ID]])
    else
      # 既に存在する(子がいる)ノード
      tree[node[RIGHT]].parent = parent[node[ID]]
    end
  end
  # 子を登録
  tree[node[ID]].left  = tree[node[LEFT]]  unless node[LEFT]  == -1
  tree[node[ID]].right = tree[node[RIGHT]] unless node[RIGHT] == -1
end

root = tree.find { |node| node.parent == -1 }

print "Preorder\n"
root.preorder
print "\nInorder\n"
root.inorder
print "\nPostorder\n"
root.postorder

