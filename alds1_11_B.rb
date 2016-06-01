D=0
F=1

class MyGraph
  attr_accessor :timestamp, :vec, :time

  def initialize(n)
    @timestamp = Array.new(n+1).map{Array.new(2,0)}
    @vec = Array.new(n+1,nil)
    @time=0
  end

  def depth_search(n)
    #p "begin:#{n}"
    #p " time:#{@time}"
    #p " timestamp:#{@timestamp}"
    @time+=1
    if @timestamp[n][D]==0
      @timestamp[n][D]=@time
    end
    @vec[n].length.times do |i|
      if @timestamp[@vec[n][i]][D]==0
        self.depth_search(@vec[n][i])
      end
    end unless @vec[n].nil? or @vec[n].empty?
    @time+=1
    @timestamp[n][F]=@time
    #p "end:#{n}"
    #p " time:#{@time}"
    #p " timestamp:#{@timestamp}"
  end

  def print_timestamp
    1.upto(timestamp.length-1) do |i|
      print "#{i} #{@timestamp[i].join(' ')}\n"
    end
  end
end

n = STDIN.gets().to_i

graph = MyGraph.new(n)

n.times do |i|
  u, k, *v = STDIN.gets().split(' ').map{ |i| i.to_i }
  graph.vec[u]=v
end

1.upto(n) do |i|
  graph.depth_search(i) if graph.timestamp[i][D]==0
end

graph.print_timestamp

