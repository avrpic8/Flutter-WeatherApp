import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool _unitFlag = false.obs;
  final RxBool _notificationFlag = true.obs;
  final RxInt _autoUpdateTime = disable.obs;
  late AppSettings? settings;

  final mainCtr = Get.find<MainController>();
  final RepositoryImp repository;

  SettingsController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fillSettingsParameters();
  }

  bool get unitFlag => _unitFlag.value;

  int get autoUpdateTime => _autoUpdateTime.value;

  bool get notificationFlag => _notificationFlag.value;

  void setUnitFlag(bool newValue) {
    _unitFlag.value = newValue;
    settings?.unit = newValue;
    repository.writeSetting(settings!);
  }

  void setAutoUpdateTime(int newValue) {
    _autoUpdateTime.value = newValue;
    settings?.autoUpdateTime = newValue;
    repository.writeSetting(settings!);
  }

  void setNotificationFlag(bool newValue) {
    _notificationFlag.value = newValue;
    settings?.notification = newValue;
    repository.writeSetting(settings!);
  }

  void fillSettingsParameters() async {
    settings = await repository.readSetting();
    _unitFlag.value = settings!.unit;
    _autoUpdateTime.value = settings!.autoUpdateTime;
    _notificationFlag.value = settings!.notification;
  }

  void removeAllCities(BuildContext context) async {
    if (!repository.isWeatherListEmpty()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Remove all',
            style: normalTextTheme.copyWith(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          content: Text(
            'Are you sure to delete all cities? this opreation cant reversed',
            style: normalTextTheme.copyWith(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                repository.deleteAllWeather();
                mainCtr.weatherList.clear();
                if (Platform.isAndroid) {
                  showToast('All data has been deleted');
                }
                Get.back();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    color: Get.theme.colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    } else {
      final snackBar = SnackBar(
        content: Text(
          'Cities list is already empty',
          style: normalTextTheme.copyWith(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
