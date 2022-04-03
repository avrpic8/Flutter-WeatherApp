import 'package:flutter/material.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:flutter_weather/app/widgets/my_app_bar.dart';
import 'package:get/state_manager.dart';

class ForecastView extends GetView<ForecastController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Seven Days Forecast'),
      body: Center(),
    );
  }
}
