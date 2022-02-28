import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/Current_weather_page.dart';
import 'package:flutter_weather/app/modules/home/widgets/dot_pager.dart';
import 'package:flutter_weather/app/widgets/weather_background.dart';
import 'package:flutter_weather/app/widgets/emptyState.dart';
import 'package:flutter_weather/app/widgets/loading.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: Stack(
            children: [
              WeatherBackground(),
              // Positioned(
              //   top: deviceHeight * 0.13,
              //   right: 0,
              //   left: 0,
              //   child: Obx(
              //     () => DotPager(
              //       dotCount: controller.currentWeatherList.length,
              //       currentIndex: 0,
              //     ),
              //   ),
              // ),
              // Obx(
              //   () {
              //     if (controller.currentWeatherList.isNotEmpty) {
              //       return PageView.builder(
              //         itemCount: controller.dataIsReady().value
              //             ? controller.currentWeatherList.length
              //             : 1,
              //         itemBuilder: (context, index) {
              //           return CurrentWeatherPage(
              //             data: controller.currentWeatherList[index],
              //           );
              //         },
              //       );
              //     } else {
              //       return EmptyState();
              //     }
              //   },
              // ),
              // Obx(() => Loading(dataLoaded: controller.dataIsReady().value)),
            ],
          ),
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
        onPressed: () {
          controller.getWeatherByCoordinate(lat: '32.6572', lon: '51.6776');
        },
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
