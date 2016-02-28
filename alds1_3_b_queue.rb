process_num, quantum = STDIN.gets().split(' ').map {|item| item.to_i}
input = STDIN.read().split("\n")
queue = []
input.each do |line|
  queue.push(line.split(" "))
end
time=0

until queue.empty?
  current_job = queue.shift
  rest = current_job[1].to_i - quantum
  if rest > 0
    time += quantum
    queue.push([current_job[0],rest])
  else
    time += quantum + rest
    puts "#{current_job[0]} #{time}"
  end
end

