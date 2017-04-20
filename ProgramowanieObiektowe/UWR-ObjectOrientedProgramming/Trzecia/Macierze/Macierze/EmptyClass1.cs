using System;

namespace Macierze
{
	class Macierz : Wektor
	{
		Wektor[] Wektory = new Wektor[10];
		public int wielkosc_macierzy = 0;

		public Macierz( Wektor[] tablica_wektorow, bool g)
		{
			Wektory = tablica_wektorow;
		}

		public Macierz(params Wektor[] tablica_wektorow)
		{
			int dlugoscTmp = tablica_wektorow.Length;
			for (int i = 0; i < dlugoscTmp; i++)
			{
				Wektory[i] = new Wektor(tablica_wektorow[i].wspolrzedne);
				wielkosc_macierzy++;
			}
			Array.Resize(ref Wektory, tablica_wektorow.Length);
		}
		public void Info()
		{
			foreach (Wektor w in Wektory)
			{
				w.Informacje();
				Console.WriteLine();
			}
		}
		public static Macierz operator +(Macierz m1, Macierz m2)
		{
			if (m1.wielkosc_macierzy != m2.wielkosc_macierzy) return null;
			else if (m1.Wektory[0].dlugosc != m2.Wektory[0].dlugosc)
			{
				Console.Write("Błąd dodawania. Różne wielkości wektorów");
				Console.WriteLine();
				return null;
			}
			else
			{
				int wielkoscTmp = m1.wielkosc_macierzy;
				Wektor[] wTmp = new Wektor[wielkoscTmp];

				for (int i = 0; i < wielkoscTmp; i++)
				{
					float[] xxx = new float[m1.Wektory[0].dlugosc];
					for (int j = 0; j < m1.Wektory[0].dlugosc; j++)
					{
						xxx[j] = m1.Wektory[i].wspolrzedne[j] + m2.Wektory[i].wspolrzedne[j];
					}
					wTmp[i] = new Wektor(xxx);

				}
				return new Macierz(wTmp);
			}
		}
		public static Macierz operator *(Macierz m1, Macierz m2) {
			int kolumnym1 = m1.wielkosc_macierzy; 
			int kolumnym2 = m2.wielkosc_macierzy;
			int wierszem1 = m1.Wektory[0].dlugosc;
			int wierszem2 = m2.Wektory [0].dlugosc;
			if (kolumnym1 != wierszem2) {return null;}
			else {
				Macierz wynikowa = new Macierz (new Wektor[wierszem1], true);
				for (int k = 0; k < wierszem1; k++) {
					wynikowa.Wektory [k] = new Wektor (new float [kolumnym2], true);
				}
				for (int i = 0; i < wierszem1; i++) {
					for (int j = 0; j < kolumnym2; j++) {
						float sum = 0;
						for (int c = 0; c < kolumnym1; c++) {
							sum += m1.Wektory [c].wspolrzedne[i] * m2.Wektory [j].wspolrzedne [c];
						}
						wynikowa.Wektory [i].wspolrzedne [j] = sum;
					}
				}
				return wynikowa;
			}
		}
		public static Macierz operator *(Macierz m1, Wektor w1) {
			Macierz m2 = new Macierz (new Wektor [1], true);
			m2.Wektory [0] = w1;
			Macierz m3 = m1 * m2;
			return m3;
	}
}
}
