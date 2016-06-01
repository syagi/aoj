include Math

class KochPoint
  attr_reader :x, :y
  
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def rot60
    return KochPoint.new( @x*cos(PI*60.0/180.0) - @y*sin(PI*60.0/180.0),
                          @x*sin(PI*60.0/180.0) + @y*cos(PI*60.0/180.0) )
  end
  
  def +(p)
    return KochPoint.new( @x + p.x, @y + p.y)
  end
  def -(p)
    return KochPoint.new( @x - p.x, @y - p.y)
  end
  def *(n)
    return KochPoint.new( @x*n,  @y*n)
  end
  def /(n)
    return KochPoint.new( @x/n,  @y/n)
  end
  
  def printp
    printf("%.8f %.8f\n", @x, @y)
  end
end

def koch_point(p1, p2, n)
  
  return if n==0
  
  s = (p1*2 + p2)/3
  t = (p1+p2*2)/3
  u = (t-s).rot60+s
  
  koch_point(p1,s,n-1)
  # print "s #{n} "
  s.printp
  koch_point(s,u,n-1)
  # print "u #{n} "
  u.printp
  koch_point(u,t,n-1)
  # print "t #{n} "
  t.printp
  koch_point(t,p2,n-1)
end


n = STDIN.gets.to_i

p1 = KochPoint.new( 0.0, 0.0)
p2 = KochPoint.new( 100.0, 0.0)

p1.printp
koch_point(p1,p2,n)
p2.printp

