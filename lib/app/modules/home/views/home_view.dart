import 'package:flutter/material.dart';
import 'package:flutter_weather/app/data/models/currentCall/weather_data.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:
            controller.getWeatherByCoordinate(lat: '32.6572', lon: '51.6776'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Loading....',
                  style: TextStyle(fontSize: 22),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 22),
                  ),
                );
              } else {
                WeatherData weather = snapshot.data as WeatherData;
                return Center(
                  child: Text(
                    weather.name,
                    style: TextStyle(fontSize: 22),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
