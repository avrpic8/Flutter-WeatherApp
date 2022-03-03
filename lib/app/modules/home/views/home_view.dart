import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/connection/connection_view.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/current_weather_page.dart';
import 'package:flutter_weather/app/modules/home/widgets/dot_pager.dart';
import 'package:flutter_weather/app/widgets/emptyState.dart';
import 'package:flutter_weather/app/widgets/loading.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {

  final connectionCtr = Get.find<ConnectionController>();

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
              weatherBackground(
                  width: deviceWidth, height: deviceHeight, weatherId: 500),
              Positioned(
                top: deviceHeight * 0.13,
                right: 0,
                left: 0,
                child: Obx(
                  () => DotPager(
                    dotCount: controller.currentWeatherList.length,
                    currentIndex: 0,
                  ),
                ),
              ),
              Obx(
                () {
                  if (controller.currentWeatherList.isNotEmpty) {
                    return PageView.builder(
                      itemCount: controller.dataIsReady().value
                          ? controller.currentWeatherList.length
                          : 1,
                      itemBuilder: (context, index) {
                        return CurrentWeatherPage(
                          data: controller.currentWeatherList[index],
                        );
                      },
                    );
                  } else {
                    return EmptyState();
                  }
                },
              ),
              Positioned(
                top: deviceHeight * 0.13,
                right: 8,
                child: Row(
                  children: [
                    ConnectionView(),
                    Obx(
                      () => Loading(
                        status: controller.dataIsReady().value,
                        mRight: 2,
                        mLeft: 8,
                      ),
                    ),
                  ],
                ),
              )
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
          if(connectionCtr.connectionStatus.value == 1){
            controller.getCurrentWeatherByCoordinate(
              lat: '32.6572', lon: '51.6776');
          }
          
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

  Widget weatherBackground(
      {required double width, required double height, required int weatherId}) {
    String path = getWeatherConditions(weatherId);
    return Stack(
      children: [
        Image.asset(
          path,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
        Container(
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
