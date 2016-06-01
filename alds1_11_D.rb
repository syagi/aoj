class MyGraph
  attr_accessor :vec,:colors

  def initialize(n)
    @vec = Array.new(n).map{Array.new()}
    @colors = Array.new(n)
  end

  def create_link(i,j)
    @vec[i].push(j)
    @vec[j].push(i)
  end

  def find_friend(i,j)
    if i>@colors.length or j>colors.length
      return "no"
    end

    if @colors[i]==@colors[j]
      return "yes"
    else
      return "no"
    end
  end

  def paint(i,color)
    if @colors[i].nil?
      @colors[i]=color
    else
      return
    end

    @vec[i].each do |v|
      self.paint(v,color)
    end
  end
end

n,m = STDIN.gets().split(' ').map{ |i| i.to_i}

graph = MyGraph.new(n)

m.times do 
  x, y = STDIN.gets().split(' ').map{ |i| i.to_i }
  graph.create_link(x,y)
end

n.times do |i|
  graph.paint(i,i)
end

q = STDIN.gets().to_i
q.times do
  i,j = STDIN.gets().split(' ').map{ |k| k.to_i }
  print "#{graph.find_friend(i,j)}\n"
end

