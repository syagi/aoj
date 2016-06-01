inputs = STDIN.gets.split('')

terrain = []
areas = []

inputs.each do |input_char|
  case input_char
  when '\\','_'
    terrain.push(input_char)
  when '/'
    current = terrain[-1]
    num_of_elements = 0
    width   = 0
    area    = 0
    pop_count = 0
    until num_of_elements == terrain.length 
      case current
      when '\\'
          # 面積計算
          area += width
          pop_count.times { area += areas.pop }
          unless area == 0
            areas.push(area)
            # 水たまりが出来たら、スタックを圧縮する
            terrain.slice!(-1*num_of_elements..-1)
            terrain.push[width]
          end
          break
      when '_'
        num_of_elements += 1
        width += 1
      when '/'
      else
        # すでにある水たまり
        num_of_elements += 1
        pop_count += 1
        width += current.to_i
      end
      current = terrain[-1*width+-1]
    end
  end
    p terrain
    p areas
end

#total area
unless areas.empty?
  print "#{areas.inject { |sum,x| sum + x }}\n"
  #num of area
  print "#{areas.count} "
  #areas
  print "#{areas.join(' ')}\n"
else
  print "0\n"
  print "0\n"
end
