using System;
using System.Net.Http;

namespace codeql_dotnet6
{
    public static class Program
    {
        public static void Main()
        {
            var client = new HttpClient();
            var response = client.GetAsync("https://google.com");
            Console.WriteLine($"Response code: {response.Status}");
        }
    }
}