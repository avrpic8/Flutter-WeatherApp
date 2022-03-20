import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CityManagerController extends GetxController {
  final homeCtr = Get.find<HomeController>();
  final RepositoryImp repository;
  List<MainWeather> tempList = [];

  CityManagerController({required this.repository});

  @override
  void onInit() {
    tempList = homeCtr.weatherList.toList();
    super.onInit();
  }

  void reorderWeatherListCity(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final MainWeather item = tempList.removeAt(oldIndex);
    tempList.insert(newIndex, item);
    update();
  }

  Future<bool> saveAndExit(List<MainWeather> tempList) async {
    if (!listEquals(homeCtr.weatherList, tempList)) {
      homeCtr.weatherList.clear();
      homeCtr.weatherList.value = tempList;
      await deleteAllWeather();
      for (var item in tempList) {
        createOrUpdateWeather(item);
      }
    }
    Get.back();
    return true;
  }

  void createOrUpdateWeather(MainWeather data) async {
    await repository.createOrUpdateWeather(data);
  }

  Future<void> deleteAllWeather() async {
    await repository.deleteAllWeather();
  }

  void removeCity(MainWeather data) {
    tempList.remove(data);
    if (tempList.isEmpty) {
      update();
    }
  }

  void removeAllCities() async {
    await Get.defaultDialog(
      radius: 5,
      title: 'Attention',
      titleStyle: normalTextTheme.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white60,
      ),
      backgroundColor: Colors.black38,
      content: Container(
        height: 65,
        child: Column(
          children: [
            Text(
              'Are you sure to delete all data?',
              style: normalTextTheme.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      tempList.clear();
                      print('delete');
                      Get.back();
                    },
                    child: Text(
                      'Sure',
                      style: normalTextTheme.copyWith(
                          fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    update();
  }
}
