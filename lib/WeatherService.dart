import 'dart:convert';
import 'package:http/http.dart' as http;

// Define a WeatherService class to handle weather data fetching.
class WeatherService {
  final String _apiKey = 'dd6e2d43d6883cdc5451370a909cd69a';

  // Asynchronous function to fetch weather data for a given city.
  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric');

    // Send a GET request to the API endpoint and wait for the response.
    final response = await http.get(url);

    // Check if the response status code is 200 (OK).
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
