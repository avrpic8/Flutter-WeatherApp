import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/Current_weather_page.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/night.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.1),
            ),
            Positioned(
              top: deviceHeight * 0.13,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => PageView.builder(
                itemCount: controller.dataIsReady().value
                    ? controller.currentWeatherList.length
                    : 1,
                itemBuilder: (context, index) {
                  if (controller.dataIsReady().value) {
                    return CurrentWeatherPage(
                        data: controller.currentWeatherList[index]);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Weather app'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.search,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/menu.svg',
            color: Colors.white,
            width: 30,
            height: 30,
          ),
        )
      ],
    );
  }
}
