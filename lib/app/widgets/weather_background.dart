import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;

    return Stack(
      children: [
        Image.asset(
          'assets/images/night.jpg',
          fit: BoxFit.cover,
          width: deviceWidth,
          height: deviceHeight,
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
