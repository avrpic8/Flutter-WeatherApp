import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:flutter_weather/app/modules/search/widgets/search_city_bar.dart';
import 'package:flutter_weather/app/widgets/loading.dart';
import 'package:flutter_weather/app/widgets/my_app_bar.dart';

import 'package:get/get.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = Get.height;

    return Scaffold(
      appBar: MyAppBar(title: 'Search City'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondryColor,
        onPressed: () {
          controller.getUserPostionAndExit(context);
        },
        child: Icon(Icons.gps_fixed),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: deviceHeight,
              padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Form(
                      key: controller.formKey,
                      child: SearchCityBar(
                        controller: controller,
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.homeCtr.getWeatherByCityName(
                                cityName: controller.editCtr.text);
                            Get.back();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Loading(
                status: controller.homeCtr.dataIsReady().value,
                color: Get.theme.colorScheme.secondary,
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
