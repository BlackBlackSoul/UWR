using System;

namespace zadanie
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Gramatyka G1 = new Gramatyka('S', 'T');
			G1.DodajProdukcje ('S', "aSb");
			G1.DodajProdukcje ('S', "aT");
			G1.DodajProdukcje ('T', "xyx");
			G1.DodajProdukcje ('S', "aTb"); 
			Console.WriteLine ("Pierwsza gramatyka, gdzie zbiór symboli nieterminalnych to: ");
			G1.Wypisz ();
			Console.WriteLine ();
			Console.WriteLine ("Oraz jej zbiór produkcji: ");
			G1.ZobaczProdukcje ();
			Gramatyka G2 = new Gramatyka ('S', 'T');
			G2.DodajProdukcje ('S', "xT");
			G2.DodajProdukcje ('S', "aaaaaaT");
			G2.DodajProdukcje ('T', "aabb");
			G2.DodajProdukcje ('T', "yyy");
			Console.WriteLine ("Druga gramatyka, gdzie zbiór symboli nieterminalnych to: ");
			G2.Wypisz ();
			Console.WriteLine ();
			Console.WriteLine ("Oraz jej zbiór produkcji: ");
			G2.ZobaczProdukcje ();
			Gramatyka G3 = new Gramatyka ('S');
			G3.DodajProdukcje ('S', "aSb");
			G3.DodajProdukcje ('S', "ab");
			G3.DodajProdukcje ('S', "ab");
			G3.DodajProdukcje ('S', "ab");
			Console.WriteLine ("Trzecia gramatyka, gdzie zbiór symboli nieterminalnych to: ");
			G3.Wypisz ();
			Console.WriteLine ();
			Console.WriteLine ("Oraz jej zbiór produkcji: ");
			G3.ZobaczProdukcje ();
			for (int i = 0; i < 3; i++) {
				if (i == 0) {Console.WriteLine ("Słowa pierwszej gramatyki: ");}
				else if (i == 1) {Console.WriteLine ("Słowa drugiej gramatyki: ");}  
				else {Console.WriteLine ("Słowa trzecie gramatyki: ");} 
				for (int j = 0; j < 10; j++) {
					if (i == 0)	{ Console.WriteLine(G1.GenerowanieLosowychSlow());
								G1.SlowoReset(); }
					else if (i == 1) { Console.WriteLine(G2.GenerowanieLosowychSlow());
								G2.SlowoReset(); }
					else { Console.WriteLine(G3.GenerowanieLosowychSlow());
								G3.SlowoReset(); }					
							}

			}
		}


	}
}
