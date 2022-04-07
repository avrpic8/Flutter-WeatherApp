import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:get/get.dart';

class CityManagerController extends GetxController {
  final mainCtr = Get.find<MainController>();
  final RepositoryImp repository;
  List<MainWeather> tempList = [];

  CityManagerController({required this.repository});

  @override
  void onInit() {
    tempList = mainCtr.weatherList.toList();
    super.onInit();
  }

  void reorderWeatherListCity(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final MainWeather item = tempList.removeAt(oldIndex);
    tempList.insert(newIndex, item);
    save(tempList);
    update();
  }

  Future<bool> saveAndExit(List<MainWeather> tempList) async {
    if (!listEquals(mainCtr.weatherList, tempList)) {
      mainCtr.weatherList.clear();
      mainCtr.weatherList.value = tempList;
      await deleteAllWeather();
      for (var item in tempList) {
        createOrUpdateWeather(item);
      }
    }
    Get.back();
    return true;
  }

  Future<void> save(List<MainWeather> tempList) async {
    mainCtr.weatherList.assignAll(tempList);
    await deleteAllWeather();
    for (var item in tempList) {
      createOrUpdateWeather(item);
    }
  }

  void backToCurrentWeatherPage(MainWeather currentWeather) {
    var index = tempList.indexOf(currentWeather);
    Get.back(result: index);
  }

  void createOrUpdateWeather(MainWeather data) async {
    await repository.createOrUpdateWeather(data);
  }

  Future<void> deleteAllWeather() async {
    await repository.deleteAllWeather();
  }

  Future<void> removeCity(MainWeather data, BuildContext context) async {
    var indexOfRemovedData = tempList.indexOf(data);
    var removedItem = tempList[indexOfRemovedData];
    tempList.remove(data);
    save(tempList);
    final snackBar = SnackBar(
      content: Text(
        'You can revers this opration!',
        style: normalTextTheme.copyWith(color: Colors.white),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          tempList.insert(indexOfRemovedData, removedItem);
          save(tempList);
          update();
        },
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (tempList.isEmpty) {
      update();
    }
  }
}
