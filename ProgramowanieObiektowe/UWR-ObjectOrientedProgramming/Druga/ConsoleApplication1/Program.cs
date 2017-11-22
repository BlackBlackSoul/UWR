using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            ListaLeniwa lista1 = new ListaLeniwa();
            lista1.wygladListy();
            Console.WriteLine(lista1.size());
            lista1.element(12);
            lista1.element(10);
            Console.WriteLine();
            lista1.wygladListy();
            Console.WriteLine();
            lista1.wygladListy();
            lista1.element(15);
            Console.WriteLine();
            lista1.wygladListy();
            Console.WriteLine(lista1.size());
            Pierwsze lista2 = new Pierwsze();
            Console.WriteLine(lista2.element(5));
            lista2.wygladListy();
            Console.WriteLine(lista2.get_rozmiar());
            Console.WriteLine(lista2.element(3));
            Console.WriteLine(lista2.element(12));
            Console.WriteLine(lista2.element(8));
            lista2.wygladListy();
        }
    }
}
