class Array
  def sum
    inject {|sum, x| sum + x}
  end
end
class Fixnum

  def czynniki
    tablicaCzynnikow = Array.new
    for i in 1...self+1
      if self % i == 0
        tablicaCzynnikow.push(i)
      end
    end
    tablicaCzynnikow
  end

  def ackerman(y)
    return y+1 if self == 0
    return (self - 1).ackerman(1) if y == 0
    (self-1).ackerman(self.ackerman(y-1))
  end

  def doskonala
    tablicaCzynnikowWlasciwych = Array.new
    for i in 1...self
      if self % i == 0
        tablicaCzynnikowWlasciwych.push(i)
      end
    end
    tablicaCzynnikowWlasciwych.sum == self
  end

  def slownie
    slownikZamiany = {0 => "zero", 1 => "jeden", 2 => "dwa", 3 => "trzy", 4 => "cztery", 5 => "pięć", 6 => "sześć", 7 => "siedem", 8 => "osiem", 9 => "dziewięć"}
    y = self
    tab = Array.new
    while y != 0
      reszta = y % 10
      y = y/10
      tab.push(slownikZamiany[reszta])
    end
    print (self)
    print (" -> ")
    for e in tab.reverse
      print (e + " ")
    end
  end

end


print (2.ackerman(1))
print ("\n")
print(6.czynniki)
print ("\n")
print (28.doskonala)
print ("\n")
123.slownie