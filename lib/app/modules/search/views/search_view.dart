import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/search/views/place_search_card.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:flutter_weather/app/modules/search/widgets/search_city_bar.dart';
import 'package:flutter_weather/app/widgets/loading.dart';
import 'package:flutter_weather/app/widgets/my_app_bar.dart';

import 'package:get/get.dart';
import 'package:mapbox_search/mapbox_search.dart';

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
                        onTap: () async {
                          if (controller.formKey.currentState!.validate()) {
                            controller.getUserCityAndExit(
                                context, controller.editCtr.text);
                          }
                        },
                        onTextChange: (text) => controller.searchPlaces(text),
                      ),
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(top: 16),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          ...controller.places
                              .map(
                                (element) => PlaceSearchCard(
                                  controller: controller,
                                  place: element,
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Loading(
                status: controller.mainCtr.dataIsReady().value,
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
