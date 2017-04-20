using System;
using System.Collections.Generic;

namespace ConsoleApplication1
{
    class ListaLeniwa
    {
        Random rnd;
        public int sizeoflist;
        public List<int> Lista;
        public string size ()
        {
            return "Rozmiar listy: " + sizeoflist;
        }
        public int element(int i)
        {
            sizeoflist = i;
            if (i < sizeoflist)
            {
                return Lista[i];
            }
            else
            {
                if (Lista.Count == 0) Lista.Add(rnd.Next());
                for (int n = Lista.Count - 1; n < i; n++)
                {
                    Lista.Add(rnd.Next());
                }
                return Lista[i];
            }
        }
        public void wygladListy()
        {
            for (int i = 0; i < Lista.Count; i++)
            {
                Console.WriteLine($"{i} = {Lista[i]}");
            }
        }
        public ListaLeniwa()
        {
            sizeoflist = 0;
            Lista = new List<int>();
            rnd = new Random();
        }

    }
}
