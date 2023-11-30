import 'dart:convert';
import 'package:weatherapp/weather_model/weather_model.dart';
import 'package:http/http.dart' as http;

class weather_service {
  String baseurl = "http://api.weatherapi.com/v1";
  String key = "2ecbf8d7f5c04a409a0144303231809";

  Future<weathermodel> getweather({required String cityname}) async {
    Uri url = Uri.parse(
        "$baseurl/forecast.json?key=$key&q=$cityname&days=1&aqi=no&alerts=no");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weathermodel model = weathermodel.fromjson(data);
    return model;
  }
}
