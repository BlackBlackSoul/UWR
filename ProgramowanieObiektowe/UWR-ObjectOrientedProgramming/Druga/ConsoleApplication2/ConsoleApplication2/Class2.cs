using System; 

namespace ConsoleApplication2
{

    class PrimeStream : IntStream
    {
        public int liczba = 1;
        public bool czyPierwsza(int liczba)
        {
            var granica = (int)Math.Floor(Math.Sqrt(liczba));
            for (int i = 2; i <= granica; ++i)
            {
                if (liczba % i == 0) return false;
            }
            return true;
        }
        public int next()
        {
            if (liczba == int.MaxValue) return -1;
            liczba += 1;
            if (liczba == 2)
                return liczba;
            else
            {
                liczba += 1;
                while (czyPierwsza(liczba) != true)
                {
                    liczba += 1;
                }
                return liczba;

            }
            liczba += 1;

        }
        public void reset()
        {
            liczba = 1;
            Console.WriteLine("RESET!!!");
        }
    }
}