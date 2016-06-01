def parent(i)
  return i/2-1
end

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

def insert(heap, key)
  heap.push(key)
  i=heap.length
  while i > 1 and heap[parent(i)] < heap[i-1]
    heap[parent(i)], heap[i-1] = heap[i-1], heap[parent(i)]
    i = parent(i)+1
  end
end

def extract(heap)
  ret = heap[0]
  heap[0] = heap.pop
  max_heapify(heap, 1)
  return ret
end

heap=[]
line = STDIN.gets().split(" ")

until line[0]=="end"
  #p heap
  case line[0]
  when 'insert' then
    insert(heap, line[1].to_i)
  when 'extract' then
    print "#{extract(heap)}\n"
  end
  line = STDIN.gets().split(" ")
end

