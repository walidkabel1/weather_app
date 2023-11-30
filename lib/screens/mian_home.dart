import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:weatherapp/providers/provider.dart';
import 'package:weatherapp/screens/search_page.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/weather_model/weather_model.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weatherstate.dart';

class mainhome extends StatelessWidget {
  mainhome({super.key});

  @override
  String? cityname;
  weathermodel? weatherdata;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 44, 78),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("search");
                },
                icon: Icon(Icons.search))
          ],
        ),
        body:
            BlocBuilder<weathercubit, weatherstate>(builder: (context, state) {
          if (state is weatherloading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is weathersuccess) {
            weatherdata = BlocProvider.of<weathercubit>(context).weathermodel1;
            return successbody(weatherdata: weatherdata);
          } else if (state is weatherfailure) {
            return Center(
              child: Container(
                child: Text("failed to get data"),
              ),
            );
          } else {
            return Center(
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text("No Weather Data Search for Your City",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            );
          }
        }));
  }
}

class successbody extends StatelessWidget {
  const successbody({
    super.key,
    required this.weatherdata,
  });

  final weathermodel? weatherdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              weatherdata!.getthemecolor(),
              weatherdata!.getthemecolor()[200],
              weatherdata!.getthemecolor()[100]
            ])),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              BlocProvider.of<weathercubit>(context).cityname!,
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Text("updated :  ${weatherdata!.date}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(weatherdata!.getimage())),
                Text("temp = ${weatherdata!.temp.toInt()}",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    Text("maxtemp = ${weatherdata!.maxtemp.toInt()}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("mintemp = ${weatherdata!.mintemp.toInt()}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Spacer(),
            Text("${weatherdata!.weathermode}",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
