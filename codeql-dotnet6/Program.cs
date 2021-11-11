using System;
using System.Net.Http;

var client = new HttpClient();
var response = client.GetAsync("https://google.com");
Console.WriteLine($"Response code: {response.Status}");