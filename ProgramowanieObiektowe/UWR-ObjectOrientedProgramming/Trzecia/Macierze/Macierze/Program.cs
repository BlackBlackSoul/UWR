using System;

namespace Macierze
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine("Wektor p1: ");
			Wektor p1 = new Wektor(0,2,4,1);
			p1.Informacje();
			Console.WriteLine();
			Console.WriteLine("Wektor p2: ");
			Wektor p2 = new Wektor(1, 2, 3, 5.53F);
			p2.Informacje();
			Console.WriteLine();
			Console.WriteLine("Dodawanie Wektorów p1 + p2. p3 to nowy wektor: ");
			Wektor p3 = p1 + p2;
			p3.Informacje();
			Console.WriteLine();
			Console.WriteLine("Mnożenie przez wektor p1 * p2. p4 to nowy wektor: ");
			Wektor p4 = p1 * p2;
			p4.Informacje();
			Console.WriteLine();
			Console.WriteLine("Mnożenie przez liczbę p1 * 5. p5 to nowy wektor: ");
			Wektor p5 = p1 * 5;
			p5.Informacje();
			Macierz m1 = new Macierz(p1, p2);
			Macierz m2 = new Macierz(p1, p3);
			Console.WriteLine();
			Console.WriteLine("Macierz m1: ");
			m1.Info();
			Console.WriteLine();
			Console.WriteLine("Macierz m2: ");
			m2.Info();
			Console.WriteLine();
			Console.WriteLine("Macierz m3. Po dodaniu macierzy m1 i m2: ");
			Macierz m3 = m1 + m2;
			m3.Info();
			Wektor pz = new Wektor(1, -1);
			Wektor px = new Wektor(0, 3);
			Wektor py = new Wektor(2, 1);
			Macierz mzxy = new Macierz(pz, px, py);
			Wektor pz1 = new Wektor(3, 2);
			Wektor px1 = new Wektor(1, 1);
			Wektor py1 = new Wektor(1, 1);
			Wektor pd1 = new Wektor(1, 1);
			Macierz mzxy1 = new Macierz(pz1, px1, py1);
			Console.WriteLine("OTO ONA: ");
			mzxy1.Info();
			Console.WriteLine();
			Console.WriteLine("------------------------------------");
			Console.WriteLine("Kolejna: ");
			mzxy.Info();
			Console.WriteLine();
			Macierz m111 = mzxy + mzxy1;
			Console.WriteLine("------------------------------------");
			Console.WriteLine("Dodanie powyższych macierzy : ");
			m111.Info();
			Console.WriteLine();
			Console.WriteLine("------------------------------------");
			Console.WriteLine();
			Wektor xkk = new Wektor(3, 2, 1);
			Wektor xnn = new Wektor(1, 1, 1);
			Macierz m222 = new Macierz(xkk, xnn);
			Wektor xoo = new Wektor (2, 2);
			Wektor xee = new Wektor (2, 2);
			Macierz m333 = new Macierz (xoo, xee);
			Macierz m444 = m222 * m333;
			m444.Info ();
			Macierz m555 = m222 * xoo;
			Console.WriteLine();
			Console.WriteLine("------------------------------------");
			Console.WriteLine();
			m555.Info ();
			Console.WriteLine ();
		}
	}
}
