n = STDIN.gets.to_i
S = STDIN.gets.split(' ').uniq.map {|i| i.to_i}
q = STDIN.gets.to_i
T = STDIN.gets.split(' ').map {|i| i.to_i}

found_count = 0
T.each do |t|
  left = 0
  right = S.length
  mid = 0
  while left < right
    mid = (left+right)/2
    # p "t: #{t}"
    # p "#{left} , #{right}"
    # p "S[mid] #{S[mid]}"
    if S[mid]==t
      found_count += 1
      break
    elsif S[mid] > t
      right = mid
    else
      left = mid + 1
    end
  end
#  p "#{t} #{S[mid]} [#{left},#{right}]"
end

print "#{found_count}\n"

