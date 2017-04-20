
# Rozszerzamy klasę Proc
class Proc
  def zapiszFunkcje(x)
    @funkcja = x
  end

  def pokazFunkcje()
    "Funkcja otrzymana do procedowania: " + @funkcja
  end
#------------------------------------------------------------------------------------------------#
  # liczymy przywolujac blok zadany w konstruktorze
  def wartosc_w_punkcie(x)
    self.call(x)
  end
#------------------------------------------------------------------------------------------------#
  # Miejsca zerowe zadanej funkcji w konstruktorze na podanym przedziale (a,b) z dokladnoscia e
  # Zakladamy, ze funkcja jest okresolna i ciagla na tym przedziale
  def miejsca_zerowe_funkcji_falsi(a, b, e)

    # Uzywamy reguly falszywej prostej, metoda falsi
    fa = wartosc_w_punkcie(a)
    fb = wartosc_w_punkcie(b)

    if fb * fa < 0
      while true
        if (fb - fa) == 0
          fb += 0.01
        end
        x0 = a - fa * (b - a) / (fb - fa);
        f0 = wartosc_w_punkcie(x0)

        if f0.abs < e
          print ("Miejsce zerowe: " +x0.to_s + "\n")
          break
        end
        if (fa * f0) < 0
          b = x0
          fb = f0
        else
          a = x0
          fa = f0
        end
      end
    else
      "Brak miejsca zerowego"
      nil
    end
  end
#------------------------------------------------------------------------------------------------#
  def miejsce_zerowe_bisekcja(a, b, e)
    # Uzwamy metody bisekcji
    polowa_odcinka = (a+b)/2.0
    val = wartosc_w_punkcie(polowa_odcinka)

    if val.abs < e
      "Miejsce zerowe: " + polowa_odcinka.to_s
    else
      a = wartosc_w_punkcie(a)
      b = wartosc_w_punkcie(b)
      if (a < 0 and val > 0) or (a > 0 and val < 0)
        miejsce_zerowe_bisekcja(a, polowa_odcinka, e)
      elsif (b > 0 and val < 0) or b < 0 and val > 0
        miejsce_zerowe_bisekcja(polowa_odcinka, b, e)
      elsif val == 0
        "Miejsce zerowe: " + polowa_odcinka.to_s
      else
        "Brak miejsc zerowych"
        nil
      end
    end
  end
#------------------------------------------------------------------------------------------------#
  def pole_pod_wykresem(a, b)
    liczba_kawalkow = 1000
    dx = (b-a)/liczba_kawalkow
    area = 0.0
    pole_kawalkow = 0.0
    liczba_kawalkow.times do |i|
      x = a + i * dx.to_f
      y = wartosc_w_punkcie(x)
      pole_kawalkow = y * dx.to_f
      area = area + pole_kawalkow
      i += 1
    end
    area
  end
#------------------------------------------------------------------------------------------------#
  def pochodna(x)
    h = 0.0001
    (0.0+wartosc_w_punkcie(x+h)-wartosc_w_punkcie(x))/h
  end
#------------------------------------------------------------------------------------------------#
  def rysowanie_wykresu()
    IO.popen('gnuplot', 'w') { |io|
      io.puts "plot " + @funkcja
      sleep(20)
    }
  end

end
f = Proc.new{|x| x**2 - 4 }
f.zapiszFunkcje("x**2 - 4")
print (f.pokazFunkcje)
print (f.wartosc_w_punkcie(2))
print ("\n")
print ("Miejsce zerower wyznaczone metodą falsi: " + "\n")
print (f.miejsca_zerowe_funkcji_falsi(1, 3, 0.000000001))
print ("Miejsce zerower wyznaczone metodą bisekcja: " + "\n")
print (f.miejsce_zerowe_bisekcja(1, 3, 0.0000000001))
print ("\n")
print ("Wartosc pochodnej w punkcie: " + f.pochodna(1).to_s)
print ("\n")
print ("Pole pod wykresem: ")
g = Proc.new{|y| y}
print ("Wartosc pochodnej w punkcie: " + g.pochodna(1).to_s)
print ("\n")
print ("Pole pod wykresem: ")
print (g.pole_pod_wykresem(1.0, 3.0))
print (" \n")
print (f.rysowanie_wykresu)