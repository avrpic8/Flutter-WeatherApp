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
      body: Center(
        child: Obx(() {
          if (controller.dataIsReady()) {
            return Text(controller.weather);
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
