class Node
  attr_accessor :id, :parent, :depth, :type, :child

  def initialize(id, parent, depth, type)
    @id = id
    @parent = parent
    @depth  = depth
    @type   = type
    @child  = []
  end

  def add_child(children)
    unless children.nil?
      children.each do |child|
        @child.push(child)
      end
    end
  end

end

ID = 0
K = 1
CHILD = 2

num_of_nodes = STDIN.gets.to_i
nodes_input = STDIN.read.split("\n")
tree = Array.new(num_of_nodes,nil)


nodes_input.each do |line|
  node = line.split(" ").map{ |i| i.to_i }
  #p node
  if tree[node[ID]].nil?
    # ���o��m�[�h ( �Ƃ肠���� root �Ƃ��ēo�^�j
    tree[node[ID]]=Node.new(node[ID],-1,0,'root')
  end
  if node[K]>0
    # �q�m�[�h��ǉ�
    tree[node[ID]].add_child(node[CHILD..-1])
    if tree[node[ID]].parent != -1
      # �e������Ȃ� internal node �Ɋm��
      tree[node[ID]].type = 'internal node'
    end
    # �q�m�[�h�̏��X�V
    node[CHILD..-1].each do |child|
      if tree[child].nil?
        # ���o��̎q�m�[�h(�Ƃ肠���� leaf �Ƃ��ēo�^)
        tree[child]=Node.new(child,node[ID],tree[node[ID]].depth+1,'leaf')
      else
        tree[child].parent = node[ID]
        tree[child].depth  = tree[node[ID]].depth+1
        if tree[child].child.empty?
          tree[child].type = 'leaf'
        else
          tree[child].type = 'internal node'
        end
      end
    end
  end
end

tree.each do |node|
  print "node #{node.id}: parent = #{node.parent}, depth = #{node.depth}, #{node.type}, [#{node.child.join(', ')}]\n"
end
