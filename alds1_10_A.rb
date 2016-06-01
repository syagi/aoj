class Fibonach
  # for mamoization 
  @@fib_table = Array.new(44,nil)

  def self.output(n)
    if n < 2
      return 1
    elsif @@fib_table[n].nil?
      @@fib_table[n] = output(n-2) + output(n-1)
    end
    return @@fib_table[n]
  end
end

input = STDIN.gets.to_i

print "#{Fibonach::output(input)}\n"

