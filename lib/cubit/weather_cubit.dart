import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weatherstate.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/weather_model/weather_model.dart';

class weathercubit extends Cubit<weatherstate> {
  String? cityname;
  weathercubit(this.weatherservice) : super(weatherintial());

  weather_service weatherservice;
  weathermodel? weathermodel1;
  void getweather({required String cityname}) async {
    emit(weatherloading());
    try {
      weathermodel1 = await weatherservice.getweather(cityname: cityname);
      emit(weathersuccess());
    } on Exception catch (e) {
      emit(weatherfailure());
      ;
    }
  }
}
