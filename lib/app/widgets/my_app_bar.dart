import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  MyAppBar({
    Key? key,
    required this.title,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.theme.colorScheme.primary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Get.theme.colorScheme.primaryContainer,
        statusBarIconBrightness: Brightness.light,
      ),
      title: Text(
        title,
        style: normalTextTheme.copyWith(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  @override
  final Size preferredSize;
}
