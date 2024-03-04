import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          // city name
          Text(_weather?.cityName ?? " Loading city..", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
          // temperature
          Text('${_weather?.temperature ?? 0}°C', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}