import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:get/get.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;
    return SafeArea(
      child: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/empty.svg',
              color: Colors.white,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Please search your first city',
              style: emptyTextTheme,
            )
          ],
        ),
      ),
    );
  }
}
