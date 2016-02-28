inputs = STDIN.gets.split('')
p inputs

terrain = []
areas = []


inputs.each do |input_char|
  case input_char
  when '\\','_'
    terrain.push(input_char)
  when '/'
    work = terrain.dup
    current = work.pop
    depth   = 0
    width   = 0
    area    = 0
    until current.nil? or depth < 0
      if current == '\\'
        if depth == 0
          area += width + 1
          break
        else
          area  += areas.pop.to_i
          depth -= 1
          width += 1
        end
      elsif current == '_'
        width += 1
      elsif current == '/'
        depth += 1
        width += 1
      end
      p "currt: #{current}"
      p "depth: #{depth}"
      p "width: #{width}"
      p "area: #{area}"
      current = work.pop
    end
    areas.push(area)
    terrain.push(input_char)
  end
  p terrain
  p areas
end

#total area
print "#{areas.inject { |sum,x| sum + x }}\n"
#num of area
print "#{areas.count} "
#areas
print "#{areas.join(' ')} "
