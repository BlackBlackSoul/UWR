using System;
using System.Threading;

namespace zadanie
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			KolekcjaLiczbPierwszych KLP = new KolekcjaLiczbPierwszych ();
			foreach(int LP in KLP) {
				System.Console.WriteLine(LP);
				Thread.Sleep (500);		
			}
		}
	}
}