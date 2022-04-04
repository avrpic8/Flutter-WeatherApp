import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/custom_toolbar.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/forecast_list.dart';
import 'package:get/get.dart';

class ForecastView extends GetView<ForecastController> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      HexColor.fromHex('#ADF7F2'),
                      HexColor.fromHex('#15AAFF'),
                    ],
                  ),
                ),
                child: Container(color: Colors.black.withOpacity(0.2)),
              ),
              CustomToolbar(title: 'Seven Days Forecast'),
              Column(
                children: [
                  Expanded(child: Column()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${controller.dataForecast.cityName!}   City',
                              style: normalTextTheme.copyWith(
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ForecastList(
                          forecastData: controller.dataForecast,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
