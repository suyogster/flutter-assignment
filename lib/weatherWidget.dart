import 'package:flutter/material.dart';
import 'package:flutter_assignment/WeatherService.dart';

// Define a stateful widget to display weather information.
class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

// Define the state for WeatherWidget.
class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService _weatherService =
      WeatherService(); // WeatherService instance for fetching weather data.
  dynamic _weatherData; // Variable to store weather data.
  final String _city = 'Barrie'; // Default city for weather information.

  @override
  void initState() {
    super.initState();
    _loadWeather(); // Load weather data when the widget is initialized.
  }

  // Asynchronous function to load weather data.
  Future<void> _loadWeather() async {
    try {
      var data = await _weatherService
          .getWeather(_city); // Fetch weather data for the specified city.
      setState(() {
        _weatherData = data; // Update weather data in the state.
      });
    } catch (e) {
      debugPrint(
          'Failed to load weather -> $e'); // Print error message if weather data loading fails.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $_city'), // Display city name in the app bar.
        backgroundColor: Colors.blueGrey, // Set app bar background color.
      ),
      body: Center(
        child: _weatherData == null
            ? const CircularProgressIndicator() // Show loading indicator while weather data is being fetched.
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    // Display weather icon based on retrieved data.
                    'http://openweathermap.org/img/w/${_weatherData['weather'][0]['icon']}.png',
                    width: 150,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons
                          .error); // Show error icon if weather icon loading fails.
                    },
                  ),
                  Text('${_weatherData['weather'][0]['main']}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      )),
                  Text('${_weatherData['main']['temp']} °C',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      )),
                  Text('${_weatherData['weather'][0]['description']}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey,
                      )),
                ],
              ),
      ),
    );
  }
}
