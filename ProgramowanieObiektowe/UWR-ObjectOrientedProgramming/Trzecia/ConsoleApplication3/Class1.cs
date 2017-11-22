using System;


namespace ConsoleApplication3
{
    class Wektor
    {
        public float[] wspolrzedne;
        public int dlugosc;
        public Wektor(params float[] wspolrzedne)
        {
            this.wspolrzedne = wspolrzedne;
            this.dlugosc = wspolrzedne.Length;
        }
        public void Informacje()
        {
            Console.Write("Liczba współrzędnych {0} oraz one: [|", dlugosc);
            foreach (float element in wspolrzedne) Console.Write(element+ "|");
            Console.Write("]");

        }
        public static Wektor operator +(Wektor w1, Wektor w2)
        {
            if (w1.dlugosc != w2.dlugosc)
            {
                Console.WriteLine("Różne długości wektorów");
                return null;
            }
            else
            {
                int dlugoscTmp = w1.dlugosc;
                float[] wspolrzedneTmp = new float[dlugoscTmp];
                for (int i = 0; i < dlugoscTmp; i++)
                {
                    wspolrzedneTmp[i] = w1.wspolrzedne[i] + w2.wspolrzedne[i];
                }
                return new Wektor(wspolrzedneTmp);
            }
        }
        public static Wektor operator *(Wektor w1, Wektor w2)
        {
            if (w1.dlugosc != w2.dlugosc)
            {
                Console.WriteLine("Różne długości wektorów");
                return null;
            }
            else
            {
                int dlugoscTmp = w1.dlugosc;
                float[] wspolrzedneTmp = new float[dlugoscTmp];
                for (int i = 0; i < dlugoscTmp; i++)
                {
                    wspolrzedneTmp[i] = w1.wspolrzedne[i] * w2.wspolrzedne[i];
                }
                return new Wektor(wspolrzedneTmp);
            }
        }
        public static Wektor operator *(Wektor w1, float dowolna_liczba)
        {
            int dlugoscTmp = w1.dlugosc;
            float[] wspolrzedneTmp = new float[dlugoscTmp];
            for (int i = 0; i < dlugoscTmp; i++)
            {
                wspolrzedneTmp[i] = w1.wspolrzedne[i] * dowolna_liczba;
            }
            return new Wektor(wspolrzedneTmp);

        }


    }
}

