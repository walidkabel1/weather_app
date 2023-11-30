import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/providers/provider.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/weather_model/weather_model.dart';

class search extends StatelessWidget {
  search({super.key});
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: TextField(
            onSubmitted: (data) async {
              var cityname = data;
              BlocProvider.of<weathercubit>(context)
                  .getweather(cityname: cityname);
              BlocProvider.of<weathercubit>(context).cityname = cityname;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                prefixIcon: Icon(Icons.search),
                hintText: "Search For Your City",
                label: Text("Search"),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
    );
  }
}
