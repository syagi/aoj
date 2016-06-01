
CMD=0
VAL=1

class Node
  attr_accessor :value,:left,:right,:parent
  def initialize (value,parent)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end

  def insert (value)
    if value < @value
      if @left.nil?
        @left = Node.new(value,self)
      else
        @left.insert(value)
      end
    else
      if @right.nil?
        @right = Node.new(value,self)
      else
        @right.insert(value)
      end
    end
  end

  def find(value)
    if value==@value
      print "yes\n"
    elsif value < @value
      if @left.nil?
        print "no\n"
      else
        @left.find(value)
      end
    else
      if @right.nil?
        print "no\n"
      else
        @right.find(value)
      end
    end
  end

  def delete(value)
     #p "before:#{@value}"
    if value == @value
      if @left.nil? or @right.nil?
         #p "removed"
        update_tree
      else
        @value = @right.get_new_value
         #p "after:#{@value}"
      end
    elsif value < @value
      @left.delete(value)
    else
      @right.delete(value)
    end
  end

  def get_new_value
    unless @left.nil?
      return @left.get_new_value
    else
      update_tree
      return @value
    end
  end
      
  def update_tree 
     #p "value: #{@value}"
     #p "@parent.value: #{@parent.value}"
    if @left.nil? and @right.nil?
      new_child = nil
    elsif @left.nil?
      new_child = @right
    elsif @right.nil?
      new_child =  @left
    else
      p "oops"
    end

    new_child.parent = @parent unless new_child.nil?

    if @value < @parent.value
      @parent.left  = new_child
       #p "parent left: #{@parent.left}"
    else
      @parent.right = new_child
       #p "parent right: #{@parent.right}"
    end
  end
  
  def print_inorder
    @left.print_inorder unless @left.nil?
    print " #{value}"
    @right.print_inorder unless @right.nil?
  end
  
  def print_preorder
    print " #{value}"
    @left.print_preorder unless @left.nil?
    @right.print_preorder unless @right.nil?
  end
end

num_of_cmd = STDIN.gets()
inputs = STDIN.read().split("\n").map{ |input| input.split(' ') }

root=nil
inputs.each do |input|
  if input[CMD] == 'insert'
    if root.nil?
      root = Node.new(input[VAL].to_i,nil)
    else
      root.insert(input[VAL].to_i)
    end
  elsif input[CMD] == 'find'
    root.find(input[VAL].to_i)
  elsif input[CMD] == 'delete'
    root.delete(input[VAL].to_i)
  else
    root.print_inorder unless root.nil?
    print "\n"
    root.print_preorder unless root.nil?
    print "\n"
  end
end

