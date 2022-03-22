import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:get/get.dart';

class EmptyState extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  final String textEmpty;
  EmptyState({
    Key? key,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    required this.textEmpty,
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
              color: iconColor,
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              textEmpty,
              style: emptyTextTheme.copyWith(color: textColor, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
