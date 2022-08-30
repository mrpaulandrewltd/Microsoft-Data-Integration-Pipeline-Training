using System;
using System.Threading;

namespace CustomActivity
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Thread.Sleep(120000); // sleep 3mins
            Console.WriteLine("Done");
        }
    }
}
