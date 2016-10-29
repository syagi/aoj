class Node
  attr_accessor :id, :parent, :depth, :sibling, :type, :left, :right

  def initialize(id, parent, depth, sibling, type)
    @id = id
    @parent = parent
    @sibling = sibling
    @depth  = depth
    @type   = type
    @left = -1
    @right = -1
  end

  def get_deg
    if (@left==-1 and @right==-1)
      return 0
    elsif (@left == -1)
      return 1
    elsif (@right == -1)
      return 1
    else
      return 2
    end
  end

  def get_height
    if (@left==-1 and @right==-1)
      return 0
    elsif (@left == -1)
      return @right.get_height + 1
    elsif (@right == -1)
      return @left.get_height + 1
    else
      return [@left.get_height, @right.get_height].max + 1
    end
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
    tree[node[ID]]=Node.new(node[ID], -1, 0, -1, 'root')
  else
    # 既に存在する(親がいる)ノード
    if( node[LEFT]>-1 or node[RIGHT]>-1)
      tree[node[ID]].type = 'internal node'
    else
      tree[node[ID]].type = 'leaf'
    end
  end

  # 左右のノードを生成
  if node[LEFT]>-1
    if tree[node[LEFT]].nil?
      # 初登場ノード ( とりあえず leaf として生成 )
      tree[node[LEFT]] = Node.new(node[LEFT],
                                node[ID],
                                tree[node[ID]].depth+1,
                                node[RIGHT],
                                'leaf')
    else
      # 既に存在する(子がいる)ノード
      tree[node[LEFT]].parent = node[ID]
      tree[node[LEFT]].depth  = tree[node[ID]].depth+1
      tree[node[RIGHT]].sibling = node[LEFT]
      tree[node[LEFT]].type = 'internal node'
    end
  end
  if node[RIGHT]>-1
    if tree[node[RIGHT]].nil?
      # 初登場ノード ( とりあえず leaf として生成 )
      tree[node[RIGHT]] = Node.new(node[RIGHT],
                                node[ID],
                                tree[node[ID]].depth+1,
                                node[LEFT],
                                'leaf')
    else
      # 既に存在する(子がいる)ノード
      tree[node[RIGHT]].parent = node[ID]
      tree[node[RIGHT]].depth  = tree[node[ID]].depth +1
      tree[node[RIGHT]].sibling = node[LEFT]
      tree[node[RIGHT]].type = 'internal node'
    end
  end
  # 子を登録
  tree[node[ID]].left  = tree[node[LEFT]]  unless node[LEFT]  == -1
  tree[node[ID]].right = tree[node[RIGHT]] unless node[RIGHT] == -1
end

tree.each do |node|
  print "node #{node.id}:"
  print " parent = #{node.parent},"
  print " sibling = #{node.sibling},"
  print " degree = #{node.get_deg},"
  print " depth = #{node.depth},"
  print " height = #{node.get_height},"
  print " #{node.type}\n"
  #print "  #{node.left}, #{node.right}\n"
end

