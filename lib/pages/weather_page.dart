import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget{
  const WeatherPage({super.key});
  
  @override
  State<WeatherPage> createState() => _WeatherPageState();
  
}

class _WeatherPageState extends State<WeatherPage>{

// api key
final _weatherService = WeatherService('5fb3c06b853a9cd52fdf2cb6e7602b94');

Weather? _weather;

// fetch weather
_fetchWeather() async{
// get the current city
String cityName = await _weatherService.getCurrentCity();

// get the weather for city
try{
  final weather = await _weatherService.getWeather(cityName);
  setState(() {
    _weather = weather;
  });
}
// any errors
catch(e){
  print(e);
}
}
// weather animations

String getWeatherAnimation(String? mainCondition) {
  if (mainCondition == null) return '/sunny.json';

  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return '/cloud.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return '/rain.json';
    case 'thunderstorm':
      return '/thunder.json';
    case 'clear':
      return '/sunny.json';
    default:
      return '/sunny.json';
  }
}


// init state
@override
void initState(){
  super.initState();

  // fetch the weather on startup
  _fetchWeather();
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // city name
          Text(_weather?.cityName ?? " Loading city.."),

          // animation 
          Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

          // temperature
          Text('${_weather?.temperature ?? 0}°C'),

          // weather condition
          Text(_weather?.mainCondition ?? ""),
        ],
        ),
      ),
    );
  }
}