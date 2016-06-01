class MyGraph
  attr_accessor :distance, :vec

  def initialize(n)
    @distance = Array.new(n+1,-1)
    @vec = Array.new(n+1,nil)
  end

  def breadth_search(n,dist)
    #p "begin:#{n}"
    #p "  dist:#{dist}"
    #p "  destance:#{@distance}"
    if @distance[n]==-1 or @distance[n]>dist
      @distance[n]=dist
    else
      return
    end
    @vec[n].each do |v|
      self.breadth_search(v,dist+1)
    end
    #p "end:#{n}"
  end

  def print_distance
    1.upto(@distance.length-1) do |i|
      print "#{i} #{@distance[i]}\n"
    end
  end
end

n = STDIN.gets().to_i

graph = MyGraph.new(n)

n.times do |i|
  u, k, *v = STDIN.gets().split(' ').map{ |i| i.to_i }
  graph.vec[u]=v
end

graph.breadth_search(1,0)

graph.print_distance

