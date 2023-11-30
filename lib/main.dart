import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weatherstate.dart';
import 'package:weatherapp/screens/mian_home.dart';
import 'package:http/http.dart';
import 'package:weatherapp/screens/search_page.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/provider.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/services/weather_service.dart';

void main() {
  runApp(BlocProvider<weathercubit>(
      create: (context) {
        return weathercubit(weather_service());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          "search": (context) => search(),
        },
        theme: ThemeData(
          primarySwatch:
              BlocProvider.of<weathercubit>(context).weathermodel1 == null
                  ? Colors.blue
                  : BlocProvider.of<weathercubit>(context)
                      .weathermodel1!
                      .getthemecolor(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: mainhome());
  }
}
