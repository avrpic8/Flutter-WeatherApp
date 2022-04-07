import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/connection/connection_view.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/background.dart';
import 'package:flutter_weather/app/modules/home/widgets/current_weather_page.dart';
import 'package:flutter_weather/app/modules/home/widgets/dot_pager.dart';
import 'package:flutter_weather/app/routes/app_pages.dart';
import 'package:flutter_weather/app/widgets/drawer.dart';
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
      drawer: SafeArea(
        child: MyDrawer(),
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            BackGround(width: deviceWidth, height: deviceHeight),
            Positioned(
              top: getSumOfAppBarAndStatusBarHeight(),
              //top: deviceHeight * 0.13,
              right: 0,
              left: 0,
              child: Obx(
                () => DotPager(
                  dotCount: controller.mainCtr.weatherList.length,
                  currentIndex: controller.selectedPageIndex.value,
                ),
              ),
            ),
            Positioned(
              top: getSumOfAppBarAndStatusBarHeight(),
              right: 8,
              child: Row(
                children: [
                  ConnectionView(),
                  Obx(
                    () => Loading(
                      status: controller.mainCtr.dataIsReady().value,
                      mRight: 2,
                      mLeft: 8,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () {
                if (controller.mainCtr.weatherList.isNotEmpty) {
                  return PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) =>
                        controller.selectedPageIndex.value = index,
                    controller: controller.pageController,
                    itemCount: controller.mainCtr.weatherList.length,
                    itemBuilder: (context, index) {
                      return CurrentWeatherPage(
                          data: controller.mainCtr.weatherList[index]);
                    },
                  );
                } else {
                  return EmptyState(
                    textEmpty: 'Please search your first city',
                    iconColor: Colors.amber,
                    textColor: Colors.white,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'WeadCast',
        style: normalTextTheme.copyWith(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () async {
            var oldList = await controller.mainCtr.getAllWeather();
            Get.toNamed(Routes.SEARCH)
                ?.then((_) => controller.goToFirstPage(oldList));
          },
        )
      ],
    );
  }
}
