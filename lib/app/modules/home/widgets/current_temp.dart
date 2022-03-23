import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class CurrentTemp extends StatelessWidget {
  final settingCtr = Get.find<SettingsController>();
  CurrentTemp({
    Key? key,
    required this.currentTemp,
    required this.iconPath,
    required this.description,
  }) : super(key: key);

  final double? currentTemp;
  final String iconPath;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            settingCtr.unitFlag.value
                ? '${currentTemp!.kelvinToFahrenheit()}\u2109'
                : '${currentTemp!.kelvinToCelsius()}\u2103',
            style: tempCurrentWeather,
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 25,
              height: 25,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(description.capitalize(),
                style: cityNameCurrentWeather.copyWith(fontSize: 20)),
          ],
        )
      ],
    );
  }
}
