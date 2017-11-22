using System;
using System.Collections;

namespace zadanie
{
	class Pierwsze: IEnumerator 
	{
		private bool czyPierwsza(int szukana) {
		var granica = (int)Math.Floor(Math.Sqrt(szukana));
		for (int i = 2; i <= granica; ++i) {
			if (szukana % i == 0) return false;
			}
		return true;
		}
		private int LiczbaPierwsza;
		public Pierwsze () {
			LiczbaPierwsza = 2;
		}
		public bool MoveNext() {
			LiczbaPierwsza = LiczbaPierwsza + 1;
			while (czyPierwsza (LiczbaPierwsza) == false) {
				LiczbaPierwsza = LiczbaPierwsza + 1;
			}
			if (LiczbaPierwsza > int.MaxValue)
				return false;
			else 
				return true;
		}
		public void Reset () {
			LiczbaPierwsza = 1;
		}

		public Object Current {
			get {return LiczbaPierwsza;}
		}
			
	}
	class KolekcjaLiczbPierwszych : IEnumerable {
		public IEnumerator GetEnumerator() {
			return new Pierwsze();
		}
	}
}