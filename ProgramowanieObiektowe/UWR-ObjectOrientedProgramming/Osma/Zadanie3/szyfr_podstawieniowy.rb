class Jawna
  def initialize(slowoPostaciJawnej)
    @slowo = slowoPostaciJawnej
  end

  def to_s
    "Słowo w jawndej postaci -> " + @slowo
  end

  def zaszyfruj(klucz)
    slowoZaszyfrowne = ""
    for e in 0...@slowo.length
      slowoZaszyfrowne += klucz[@slowo[e]]
    end
    "A to słowo zaszyforwane -> " + slowoZaszyfrowne
    Zaszyfrowane.new(slowoZaszyfrowne)
  end

end

class Zaszyfrowane
  def initialize(slowoPostaciZaszyfrowanej)
    @slowo = slowoPostaciZaszyfrowanej
  end

  def to_s
    "Słowo zaszyfrowane -> " + @slowo
  end

  def odszyfruj(klucz)
    slowoJawne = ""
    for e in 0...@slowo.length
      slowoJawne += klucz[@slowo[e]]
    end
    "A to słowo odszyfrowane -> " + slowoJawne
    Jawna.new(slowoJawne)
  end

end

klucz1 = {'a' => 'c', 'b' => 'd', 'c' => 'e', 'd' => 'f',
          'e' => 'g', 'f' => 'h', 'g' => 'i', 'h' => 'j', 'i' => 'k',
          'j' => 'l', 'k' => 'm', 'l' => 'n', 'm' => 'o', 'n' => 'p',
          'o' => 'r', 'p' => 's', 'r' => 't', 's' => 'u', 't' => 'w',
          'u' => 'x', 'w' => 'y', 'x' => 'z', 'y' => 'a', 'z' => 'b'}
klucz2 = {'c' => 'a', 'd' => 'b', 'e' => 'c', 'f' => 'd',
          'g' => 'e', 'h' => 'f', 'i' => 'g', 'j' => 'h', 'k' => 'i',
          'l' => 'j', 'm' => 'k', 'n' => 'l', 'o' => 'm', 'p' => 'n',
          'r' => 'o', 's' => 'p', 't' => 'r', 'u' => 's', 'w' => 't',
          'x' => 'u', 'y' => 'w', 'z' => 'x', 'a' => 'y', 'b' => 'z'}

slowo1 = Jawna.new("abcx")
print (slowo1)
print ("\n")
print (slowo1.zaszyfruj(klucz1))
a = slowo1.zaszyfruj(klucz1)
print ("\n")
print (a.odszyfruj(klucz2))