using System;

namespace ConsoleApplication2
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Liczby naturalne: ");
            IntStream pierwszy_stream = new IntStream();
            Console.WriteLine(pierwszy_stream.next());
            Console.WriteLine(pierwszy_stream.next());
            Console.WriteLine(pierwszy_stream.next());
            pierwszy_stream.reset();
            Console.WriteLine(pierwszy_stream.next());
            Console.WriteLine(pierwszy_stream.eos());
            Console.WriteLine();
            Console.WriteLine("Liczby pierwsze: ");
            PrimeStream drugi_stream = new PrimeStream();
            Console.WriteLine(drugi_stream.next());
            Console.WriteLine(drugi_stream.next());
            Console.WriteLine(drugi_stream.next());
            Console.WriteLine(drugi_stream.next());
            drugi_stream.reset();
            Console.WriteLine(drugi_stream.next());
            Console.WriteLine(drugi_stream.next());
            Console.WriteLine(drugi_stream.eos());
            Console.WriteLine();
            Console.WriteLine("Liczby losowe: ");
            RandomStream trzeci_stream = new RandomStream();
            Console.WriteLine(trzeci_stream.next());
            Console.WriteLine(trzeci_stream.next());
            Console.WriteLine(trzeci_stream.next());
            Console.WriteLine(trzeci_stream.next());
            Console.WriteLine(trzeci_stream.next());
            trzeci_stream.reset();
            Console.WriteLine(trzeci_stream.next());
            Console.WriteLine(trzeci_stream.eos());
            Console.WriteLine();
            Console.WriteLine("Losowe słowa: ");
            WordStream czwarty_stream = new WordStream();
            Console.WriteLine(czwarty_stream.next());
            Console.WriteLine(czwarty_stream.next());
            Console.WriteLine(czwarty_stream.next());
            Console.WriteLine(czwarty_stream.next());
        }
    }
}
