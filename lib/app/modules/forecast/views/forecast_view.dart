import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/chart_panel.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/custom_toolbar.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/forecast_list.dart';
import 'package:get/get.dart';

class ForecastView extends GetView<ForecastController> {
  @override
  Widget build(BuildContext context) {
    List<String>? colors =
        gradientColors[controller.randomBackGroundColorNumber];

    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  HexColor.fromHex(colors![0]),
                  HexColor.fromHex(colors[1]),
                ],
              ),
            ),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          Column(
            children: [
              CustomToolbar(title: 'Seven Days Forecast'),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height - 76,
                    child: Column(
                      children: [
                        Expanded(
                          child: ChartPanel(controller: controller),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                                height: 30,
                              ),
                              ForecastList(
                                forecastData: controller.dataForecast,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
