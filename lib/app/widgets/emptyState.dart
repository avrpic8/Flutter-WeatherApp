import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:get/get.dart';

class EmptyState extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  EmptyState({
    Key? key,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  }) : super(key: key);

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
              'assets/images/weatherSvg/empty.svg',
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Please search your first city',
              style: emptyTextTheme.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
