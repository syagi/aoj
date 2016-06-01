n = STDIN.gets
S = STDIN.gets.split(' ')
q = STDIN.gets
T = STDIN.gets.split(' ')

found_count=0
T.each do |t|
  S.each do |s|
    if t == s
      found_count += 1
      break
    end
  end
end

print "#{found_count}\n"

