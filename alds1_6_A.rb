
def counting_sort(a, k)
  n = a.length
  b = Array.new(n)
  c = Array.new(k+1,0)

  n.times do |i|
    c[a[i]]+=1
  end

  1.upto(k) do |i|
    c[i]+=c[i-1]
  end

  (n-1).downto(0) do |i|
    b[c[a[i]]]=a[i]
    c[a[i]]-=1
  end
  return b.compact
end

n = STDIN.gets
a = STDIN.gets.split(' ').map{ |i| i.to_i }

print "#{counting_sort(a, a.max).join(' ')}\n"

