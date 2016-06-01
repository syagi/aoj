def solve(ans, array)
  if ans == 0
    return true
  elsif array.nil? or array.empty?
    return false
  elsif array.length == 1
    if ans == array[0]
      return true
    else
      return false
    end
  else
     solve(ans-array[0], array[1..-1]) or solve(ans, array[1..-1])
  end
end

n = STDIN.gets.to_i
A = STDIN.gets.split(" ").map { |i| i.to_i }

q = STDIN.gets.to_i
M = STDIN.gets.split(" ").map { |i| i.to_i }

M.each do |m|
  if solve(m, A)
    print "yes\n"
  else
    print "no\n"
  end
end
