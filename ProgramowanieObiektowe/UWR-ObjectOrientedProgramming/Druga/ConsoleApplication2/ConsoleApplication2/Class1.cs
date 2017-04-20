using System;

namespace ConsoleApplication2
{
        class IntStream
        {
            int pierwsza_naturalna = -1;
            public int next()
            {
                pierwsza_naturalna += 1;
                return pierwsza_naturalna;
            }
            public bool eos()
            {
                return (pierwsza_naturalna == int.MaxValue);
            }
            public void reset()
            {
                pierwsza_naturalna = -1;
                Console.WriteLine("RESET!!");
            }
        }
}