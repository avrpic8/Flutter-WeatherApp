import 'package:flutter/material.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:flutter_weather/app/modules/search/widgets/search_city_bar.dart';
import 'package:get/get.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.gps_fixed)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          width: double.infinity,
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
      ),
    );
  }
}
