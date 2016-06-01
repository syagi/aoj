n = STDIN.gets().to_i

a = Array.new(n).map{Array.new(n,0)}
n.times do |i|
  u, k, *vec = STDIN.gets().split(' ').map{ |i| i.to_i }
  #p "u:#{u}"
  vec.each do |v|
    #p "v:#{v}"
    a[u-1][v-1]=1
  end unless k==0
end

a.each do |line|
  print "#{line.join(' ')}\n"
end

