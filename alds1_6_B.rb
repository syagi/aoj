
def partition(a, p ,r)
  x =a[r]
  i = p-1
  p.upto(r-1) do |j|
    if a[j]<=x
      i += 1
      tmp  = a[i]
      a[i] = a[j]
      a[j] = tmp
    end
  end
  tmp  = a[r]
  a[r] = a[i+1]
  a[i+1] = tmp
  return i+1
end

n = STDIN.gets.to_i
a = STDIN.gets.split(' ').map { |i| i.to_i }

q = partition(a, 0, a.length-1)

a.each_with_index do |value, i|
  if i==q
    print "[#{value}] "
  elsif i==a.length-1
    print "#{value}\n"
  else
    print "#{value} "
  end
end

