using System;

namespace ConsoleApplication2
{
    class RandomStream : IntStream
    {
        public Random rnd = new Random();
        public int next()
        {
            return rnd.Next();
        }
        public bool eos()
        {
            return false;
        }

    }
}
