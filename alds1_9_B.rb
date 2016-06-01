def left(i)
  return i*2-1
end

def right(i)
  return i*2
end

def max_heapify(heap,i)
  l=left(i)
  r=right(i)

  if l < heap.length and heap[l] > heap[i-1]
    largest = l
  else
    largest = i-1
  end
  if r < heap.length and heap[r] > heap[largest]
    largest = r
  end

  if largest != i-1
    heap[i-1], heap[largest] = heap[largest], heap[i-1]
    max_heapify(heap, largest+1)
  end
end

def build_max_heap(heap)
  heap.length.downto(1) do |i|
    max_heapify(heap, i)
  end
end

heap_size = STDIN.gets()
heap = STDIN.gets().split(' ').map{ |i| i.to_i }

build_max_heap(heap)

print "#{heap.join(' ')}\n"

