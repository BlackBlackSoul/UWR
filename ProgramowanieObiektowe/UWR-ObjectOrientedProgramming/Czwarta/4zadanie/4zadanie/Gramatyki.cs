using System;
using System.Threading;
using System.Text;
namespace zadanie
{
	public class Gramatyka
		{
		private string slowo = "";
		private Random rnd = new Random();
		private int IteratorZbioruProdukcji = 0;
		private char[] Terminale;
		private Tuple<int, char, string>[] ZbiorProdukcji = new Tuple <int, char, string>[4];

		public Gramatyka(params char[] Terminale) {
			this.Terminale = Terminale;
		}
		public void Wypisz() {
			foreach(char element in Terminale) {
				Console.Write (element+ " ");
			}
		}
		public void DodajProdukcje (char A, string B) {
			ZbiorProdukcji[IteratorZbioruProdukcji] = Tuple.Create<int, char, string>(IteratorZbioruProdukcji,A, B);
			IteratorZbioruProdukcji++;
		}
		public void ZobaczProdukcje () {
			for (int i = 0; i < ZbiorProdukcji.Length; i++) {
				Console.WriteLine (ZbiorProdukcji [i]);
			}
		}
		static bool MaleLitery(string slowo1)
		{
			for (int i = 0; i < slowo1.Length; i++)
			{
				if (Char.IsUpper (slowo1 [i]))
					return false;
			}

			return true;
		}
		public string GenerowanieLosowychSlow() {
			int PierwszeGenerowanie = rnd.Next (0, ZbiorProdukcji.Length);
			while (ZbiorProdukcji [PierwszeGenerowanie].Item2 != 'S') {
				PierwszeGenerowanie = rnd.Next (0, ZbiorProdukcji.Length);
			}
			slowo += ZbiorProdukcji [PierwszeGenerowanie].Item3;

			while (MaleLitery (slowo) != true) {
				for (int i = 0; i < slowo.Length; i++) {
					if (Char.IsUpper (slowo [i])) {
						int IndeksGenerowania = rnd.Next (0, ZbiorProdukcji.Length);
						if (ZbiorProdukcji[IndeksGenerowania].Item2 == slowo[i]) {
							StringBuilder asd = new StringBuilder (slowo);
							asd.Replace (asd [i].ToString (), ZbiorProdukcji [IndeksGenerowania].Item3); 
							slowo = asd.ToString();
						}
					}
				}
			}
			return slowo;
		}
		public string SlowoReset() {
			slowo = "";
			return slowo;
		}

	}
}

