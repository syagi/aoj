class SequencePair
  @@lcs_table = Array.new(1001).map{Array.new(1001,0)}

  def initialize(seq1, seq2)
    @seq1 = seq1.chomp
    @seq2 = seq2.chomp
    @seq1_len = @seq1.length
    @seq2_len = @seq2.length
    @@lcs_table[0][0]=0
    @@lcs_table[0][1]=0
    @@lcs_table[1][0]=0
    #@lcs_table = Array.new(seq1.length).map{Array.new(seq2.length,0)}
  end

  def lcs_len
    if @seq1_len*@seq2_len==0
      return 0
    else
      1.upto(@seq1_len) do |i|
        1.upto(@seq2_len) do |j|
          if @seq1[i-1]==@seq2[j-1]
            @@lcs_table[i][j] = @@lcs_table[i-1][j-1] + 1
          else
            @@lcs_table[i][j] = [@@lcs_table[i-1][j], @@lcs_table[i][j-1]].max
          end
        end
      end
      return @@lcs_table[@seq1_len][@seq2_len]
    end
  end
end

q = STDIN.gets.to_i

 seq_pair=SequencePair.new(seq1,seq2) 
q.times do
  seq1 = STDIN.gets
  seq2 = STDIN.gets
  print "#{seq_pair.lcs_len}\n"
end

