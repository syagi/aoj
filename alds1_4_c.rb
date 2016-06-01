class Node
  def initilize
    @act = false
  end

  def insert(val)
    if val.empty?
      @act=true
    else
      case val[0]
      when 'A'
        @a = Node.new if @a.nil?
        @a.insert(val[1..-1])
      when 'C'
        @c = Node.new if @c.nil?
        @c.insert(val[1..-1])
      when 'G'
        @g = Node.new if @g.nil?
        @g.insert(val[1..-1])
      when 'T'
        @t = Node.new if @t.nil?
        @t.insert(val[1..-1])
      end
    end
  end
  
  def find(val)
    if val.empty?
      return @act
    else
      case val[0]
      when 'A'
        @a and @a.find(val[1..-1])
      when 'C'
        @c and @c.find(val[1..-1])
      when 'G'
        @g and @g.find(val[1..-1])
      when 'T'
        @t and @t.find(val[1..-1])
      end
    end
  end
  
  def dump
    p "@act: #{@act}, a:#{@a}, c:#{@c}, g:#{@g}, t:#{@t}"
  end
end

num = STDIN.gets
commands = STDIN.read.split("\n")

root = Node.new
commands.each do |command|
  proc,arg = command.split(' ')
  # p "command: #{proc} #{arg}"
  case proc
  when 'insert'
    root.insert(arg)
  when 'find'
    if root.find(arg)
      print "yes\n"
    else
      print "no\n"
    end
  end
end

