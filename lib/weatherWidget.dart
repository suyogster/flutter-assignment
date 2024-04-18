import 'package:flutter/material.dart';
import 'package:flutter_assignment/WeatherService.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService _weatherService = WeatherService();
  dynamic _weatherData;
  final String _city = 'Barrie';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      var data = await _weatherService.getWeather(_city);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      debugPrint('Failed to load weather-> $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $_city'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: _weatherData == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'http://openweathermap.org/img/w/${_weatherData['weather'][0]['icon']}.png',
                    width: 150,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
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
