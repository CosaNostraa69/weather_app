import 'dart:convert';
import 'package:geocoding/geocoding.dart';
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
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error fetching weather');
    }
  }
  Future<String> getCurrentCity() async{

    // get permission from user
LocationPermission permission = await Geolocator.checkPermission();

if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    // Les permissions ont été refusées.
    print("Les permissions de localisation ont été refusées.");
    return "";
  }
}

if (permission == LocationPermission.deniedForever) {
  // Les permissions ont été refusées de façon permanente, on ne peut pas demander les permissions.
  print("Les permissions de localisation ont été refusées de façon permanente.");
  return "";
}

    // fetch the current location

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // convert the location into a list of placemark objects

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    // extract the city name from the the first placemark 

    String? city = placemarks[0].locality;
    
    return city ?? "";
  }
}