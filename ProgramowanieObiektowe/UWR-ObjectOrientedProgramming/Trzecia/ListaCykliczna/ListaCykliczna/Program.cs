using System;

namespace ListaCykliczna
{	
	class Element<T> {
		public Element <T> previous;
		public Element <T> next;
		public T value;

		public Element(T val){
			value = val;
		}

		public Element(){
			previous = next = null;
		}

		public void SetPredecesor(Element<T> toSet){
			Element<T> prev = previous;
			prev.next = toSet;
			toSet.previous = prev;
			this.previous = toSet;
			toSet.next = this;
		}
		public void SetSuccesor(Element<T> toSet){
			Element<T> nastepny = next;
			nastepny.previous = toSet;
			toSet.next = nastepny;
			this.next = toSet;
			toSet.previous = this;
		
		} 
		public void deleteNext () {
			Element<T> nowyNastepnik = this.next.next;
			SetSuccesor (nowyNastepnik);
		}
		public void deletePrevious() {
			SetPredecesor (this.previous.previous);
		}

	}
	class Lista<T> {

		private Element <T> glowaIOgon;


		public void Clear(){
			glowaIOgon = new Element<T> (); 
			glowaIOgon.next = glowaIOgon.previous = glowaIOgon;
		}

		public Lista(){
			Clear ();		}

		private void DodajNaPoczatek(Element <T> toEnd){
			glowaIOgon.SetSuccesor (toEnd);
		}
		public void DodajNaPoczatek(T value) {
			DodajNaPoczatek (new Element<T> (value));
		}

		public void DodajNaKoniec(T value) {
			Element<T> doWstawienia = new Element<T> (value);
			DodajNaKoniec (doWstawienia);
		}
		private void DodajNaKoniec(Element <T> toBegin){
			glowaIOgon.SetPredecesor (toBegin);
		}
		public bool czy_pusta(Lista<T> ask) {return glowaIOgon.next == glowaIOgon;}

		public void UsunZKonca() {
			glowaIOgon.deletePrevious();
		}
		public void UsunZPoczatku() {
			glowaIOgon.deleteNext ();
		}
		public void Wypisz() {
			Wypisz (glowaIOgon.next);
			Console.WriteLine ();
		}

		private void Wypisz(Element<T> e) {
			if (e == glowaIOgon)
				return;
			else {
				Console.Write (e.value + "  ");
				Wypisz (e.next);
				
			}
		}

	
	}


	class Program {
		static void Main(string[] args) {
			Console.WriteLine ("HELLO");
			Lista<int> ask = new Lista<int>();
			ask.UsunZKonca ();
			ask.Wypisz ();
			ask.DodajNaKoniec (5);
			ask.DodajNaKoniec (6);
			ask.DodajNaPoczatek (2);
			ask.Wypisz ();
			ask.UsunZKonca ();
			ask.Wypisz ();
		}
	}
}