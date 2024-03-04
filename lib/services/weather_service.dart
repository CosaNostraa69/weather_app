import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  static const BASE_URL = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather>getWeather(String cityName) async{
    final response = await http.get(Uri.parse( '$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if(response.statusCode == 200){
      return Weather.fromJson(response.body);
    }else{
      throw Exception('Error fetching weather');
    }
  }
  Future<String> getCurrentCity() async{

    // get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    // fetch the current location
  }
}