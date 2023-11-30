import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class weathermodel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weathermode;

  weathermodel({
    required this.weathermode,
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
  });

  factory weathermodel.fromjson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return weathermodel(
        date: data['location']['localtime'],
        temp: jsondata['avgtemp_c'],
        maxtemp: jsondata['maxtemp_c'],
        mintemp: jsondata['mintemp_c'],
        weathermode: jsondata['condition']['text']);
  }

  getimage() {
    if (weathermode == "Clear" || weathermode == "Lightcloud") {
      return "images/clearweather.png";
    } else if (weathermode == "Sleat" ||
        weathermode == "Snow" ||
        weathermode == "Hail") {
      return "images/snowweather.png";
    } else if (weathermode == "Partly cloudy") {
      return "images/heavycloud.png";
    } else if (weathermode == "Light Rain" ||
        weathermode == "Heavy Rain" ||
        weathermode == "Showers") {
      return "images/showers.png";
    } else if (weathermode == "Thunder Storm") {
      return "images/thunderstorm.png";
    } else {
      return "images/clearweather.png";
    }
  }

  getthemecolor() {
    if (weathermode == "Clear" || weathermode == "Sunny") {
      return Colors.orange;
    } else if (weathermode == "Sleat" ||
        weathermode == "Snow" ||
        weathermode == "Hail") {
      return Colors.orange;
    } else if (weathermode == "Partly cloudy") {
      return Colors.blue;
    } else if (weathermode == "Light Rain" ||
        weathermode == "Heavy Rain" ||
        weathermode == "Showers") {
      return Colors.orange;
    } else if (weathermode == "Thunder Storm") {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }
}
