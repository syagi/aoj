SENTINEL=10**9+1
$count=0

def merge(array, left, mid, right)
  n1 = mid -left;
  n2 = right - mid;

  # create array left_array[0...n1], right_array[0...n2]
  left_array=Array.new(n1+1)
  right_array=Array.new(n2+1)
  (n1).times do |i|
    left_array[i] = array[left+i]
  end
  (n2).times do |i|
    right_array[i] = array[mid+i]
  end
  left_array[n1] = SENTINEL
  right_array[n2] = SENTINEL

  i = 0
  j = 0
  for k in left..(right-1)
    $count += 1
    if left_array[i] <= right_array[j]
      array[k] = left_array[i]
      i += 1
    else
      array[k] = right_array[j]
      j += 1
    end
  end
  return array
end

def merge_sort(array, left, right)
  if left+1 < right
    mid = (left + right) / 2
    merge_sort(array, left, mid)
    merge_sort(array, mid, right)
    merge(array, left, mid, right)
  end
end

n = STDIN.gets.to_i
S = STDIN.gets.split(" ").map { |i| i.to_i }


print "#{merge_sort(S, 0, n).join(' ')}\n"
print "#{$count}\n"
