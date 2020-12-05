import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherRepo{

  Future<WeatherModel> getWeatherModel(String cityName) async{

    final result = await http.Client().get("http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6a51695be393195e9ed3724611d99cf7");

    if(result.statusCode!=200){
      throw Exception();
    }
    return parseJson(result.body);
  }

  WeatherModel parseJson(final response){

    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);

  }
}