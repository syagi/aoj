
CMD=0
VAL=1

class Node
  attr_accessor :value,:left,:right
  def initialize (value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert (value)
    if value < @value
      if @left.nil?
        @left = Node.new(value)
      else
        @left.insert(value)
      end
    else
      if @right.nil?
        @right = Node.new(value)
      else
        @right.insert(value)
      end
    end
  end

  def find(value)
    #p "@value:#{@value}"
    if value==@value
      print "yes\n"
    elsif value < @value
      #p "left:#{@left}"
      if @left.nil?
        print "no\n"
      else
        @left.find(value)
      end
    else
      #p "right:#{@right}"
      if @right.nil?
        print "no\n"
      else
        @right.find(value)
      end
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
      root = Node.new(input[VAL].to_i)
    else
      root.insert(input[VAL].to_i)
    end
  elsif input[CMD] == 'find'
    root.find(input[VAL].to_i)
  else
    root.print_inorder unless root.nil?
    print "\n"
    root.print_preorder unless root.nil?
    print "\n"
  end
end

