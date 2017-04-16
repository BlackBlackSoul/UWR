using System;

namespace ConsoleApplication2
{
    class WordStream : PrimeStream
    {
        public static Random rnd = new Random();
        public static PrimeStream pierwsza = new PrimeStream();
        public char jednalitera()
        {
            int numer = rnd.Next(97, 122);
            char litera = Convert.ToChar(numer);
            return litera;
        }
        public string next()
        {
            int dlugosc = pierwsza.next();
            int i = 1;
            string slowo = "";
            while (i <= dlugosc)
            {
                slowo += jednalitera();
                i += 1;
            }
            return slowo;
        }
    }
}
