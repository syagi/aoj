
def lcs_len(seq1,seq2)
  seq1_len, seq2_len = seq1.length , seq2.length
  lcs_table = Array.new(seq1_len+1).map{Array.new(seq2_len+1,0)}
  1.upto(seq1_len) do |i|
    1.upto(seq2_len) do |j|
      if seq1[i-1]==seq2[j-1]
        lcs_table[i][j] = lcs_table[i-1][j-1] + 1
      else
        if lcs_table[i-1][j] > lcs_table[i][j-1]
          lcs_table[i][j] = lcs_table[i-1][j]
        else
          lcs_table[i][j] = lcs_table[i][j-1]
        end
      end
    end
  end
  return lcs_table[seq1_len][seq2_len]
end

q = STDIN.gets.to_i

q.times do
  seq1 = STDIN.gets.chomp
  seq2 = STDIN.gets.chomp
  print "#{lcs_len(seq1,seq2)}\n"
end

