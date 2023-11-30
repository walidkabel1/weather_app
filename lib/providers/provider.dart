import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/weather_model/weather_model.dart';

class myprov extends ChangeNotifier {
  weathermodel? _weatherdata;
  String? cityname;
  set weatherdata(weathermodel? model) {
    _weatherdata = model;
    notifyListeners();
  }

  weathermodel? get weatherdata => _weatherdata;
}
