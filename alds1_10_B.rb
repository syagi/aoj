class MatrixChainMul
  # for memoization
  @@MATRIX_MAX_NUM= 100
  @@MATRIX_MAX_SIZE = 100
  @@INF = @@MATRIX_MAX_SIZE**3
  @@mul_times_table = Array.new(@@MATRIX_MAX_NUM).map{Array.new(@@MATRIX_MAX_NUM,0)}

  def self.debugout
    10.times do |n|
      p @@mul_times_table[n]
    end
  end

  def self.min_mul_times (n,p)
    if n < 2
      return 0
    end
    2.upto(n) do |l|
      1.upto(n-l+1) do |i|
        j = i + l - 1
        @@mul_times_table[i][j] = @@INF
        i.upto(j-1) do |k|
          # p "i:#{i}, j:#{j}, k:#{k}"
          # p "m[i][k]:#{@@mul_times_table[i][k]}"
          # p "m[i][j]:#{@@mul_times_table[i][j]}"
          # p "m[k+1][j]:#{@@mul_times_table[k+1][j]}"
          @@mul_times_table[i][j] = [ @@mul_times_table[i][j], @@mul_times_table[i][k] + @@mul_times_table[k+1][j] + p[i-1]*p[k]*p[j] ].min
          
          #self.debugout
        end
      end
    end
    return @@mul_times_table[1][n]
  end
end

n = STDIN.gets.to_i
p = Array.new(n+1,nil)
1.upto(n) do |i|
  p[i-1],p[i] = STDIN.gets.split(' ').map{ |j| j.to_i }
end

print "#{MatrixChainMul::min_mul_times(n,p)}\n"

