inputs = STDIN.gets.split('')

terrain = []
areas = []

inputs.each do |input_char|
  case input_char
  when '\\','_'
    terrain.push(input_char)
  when '/'
    current = terrain[-1]
    depth   = 0
    width   = 0
    area    = 0
    pop_count = 0
    until depth < 0
      if current == '\\'
        if depth == 0
          # 同じ高さの対岸が見つかった
          area += width + 1
          # 水たまりが完成した場合のみ統合
          pop_count.times { area += areas.pop }
          break
        elsif depth == 1
          # 元あった水たまりを統合
          # 水たまりができあがらない可能性があるので後で処理
          pop_count += 1
        end
        depth -= 1
        width += 1
      elsif current == '_'
        width += 1
      elsif current == '/'
        depth += 1
        width += 1
      end
      if width < terrain.length 
        current = terrain[-1*width+-1]
      else
        break
      end
    end
    areas.push(area) unless area == 0
    terrain.push(input_char)
  end
   # p terrain
   # p areas
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
