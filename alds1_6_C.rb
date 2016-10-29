class Card
  attr_reader :suit, :number

  def initialize(suit, number)
    @suit   = suit
    @number = number.to_i
  end

  def <=(other)
    @number <= other.number
  end

  def prints
    print "#{suit} #{number}\n"
  end

  def <=>(other)
   @number - other.number 
  end
end

def quick_sort(a, p, r)
  if p < r
    q = partition(a, p, r)
    quick_sort(a, p, q-1)
    quick_sort(a, q+1, r)
  end
end

def partition(a, p, r)
  x = a[r]
  i = p-1
  p.upto(r-1) do |j|
    if a[j] <= x
      i += 1
      tmp  = a[i]
      a[i] = a[j]
      a[j] = tmp
    end
  end
  tmp    = a[r]
  a[r]   = a[i+1]
  a[i+1] = tmp
  return i+1
end

n = STDIN.gets.to_i
inputs = STDIN.read.split("\n")

cards = []

inputs.each do |input|
  card = input.split(" ")
  cards.push(Card.new(card[0],card[1]))
end
orig_cards = cards.dup

quick_sort(cards,0,cards.length-1)

if cards==orig_cards.sort
  print "Stable\n"
else
  print "Not stable\n"
end

cards.each do |card|
  card.prints
end
