import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class CurrentWhp extends StatelessWidget {
  final settingCtr = Get.find<SettingsController>();
  final WeatherData data;
  CurrentWhp({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1.5,
          color: Colors.white30,
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Wind', style: wphCurrentWeather),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          settingCtr.unitFlag
                              ? data.current!.windSpeed!.toMilesPerHour()
                              : data.current!.windSpeed!.toStringAsFixed(1),
                          style: wphCurrentWeather.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Obx(
                        () => Text(settingCtr.unitFlag ? 'miles/hour' : 'm/sec',
                            style: wphCurrentWeather),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Pressure',
                    style: wphCurrentWeather,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(data.current!.pressure.toString(),
                          style: wphCurrentWeather.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        width: 8,
                      ),
                      Text(' hPa', style: wphCurrentWeather),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text('Humidity', style: wphCurrentWeather),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(data.current!.humidity.toString(),
                          style: wphCurrentWeather.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(
                        width: 8,
                      ),
                      Text('%', style: wphCurrentWeather),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
