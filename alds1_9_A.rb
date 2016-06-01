heap_size = STDIN.gets().to_i
heap_keys = STDIN.gets().split(' ').map{ |i| i.to_i }

1.upto(heap_size) do |i|
  print "node #{i}: key = #{heap_keys[i-1]}, "
  print "parent key = #{heap_keys[i/2-1]}, " unless i==1
  print "left key = #{heap_keys[i*2-1]}, " unless i*2-1>=heap_size
  print "right key = #{heap_keys[i*2]}, " unless i*2>=heap_size
  print "\n"
end

