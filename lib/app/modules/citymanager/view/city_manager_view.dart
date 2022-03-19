import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/citymanager/controllers/city_manager_controller.dart';
import 'package:get/state_manager.dart';

class CityManagerView extends GetView<CityManagerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black87,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'City manager',
          style: normalTextTheme.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
