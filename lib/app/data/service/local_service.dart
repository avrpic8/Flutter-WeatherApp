import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalService extends GetxService {
  final Box<MainWeather> weatherBox;
  final Box<AppSettings> settingsBox;

  LocalService({required this.weatherBox, required this.settingsBox});

  Future<MainWeather> createOrUpdateWeather(MainWeather data) async {
    if (data.isInBox) {
      data.save();
    } else {
      await weatherBox.add(data);
    }
    return data;
  }

  Future<List<MainWeather>> getAllWeather() async {
    return weatherBox.values.toList();
  }

  Future<void> deleteAllWeather() {
    return weatherBox.clear();
  }

  bool isWeatherListEmpty() {
    return weatherBox.isEmpty;
  }

  Future<void> writeSetting(AppSettings data) async {
    settingsBox.put(dbSettingsKey, data);
  }

  Future<AppSettings?> readSetting() async {
    return settingsBox.get(dbSettingsKey, defaultValue: AppSettings());
  }

  Future<void> clear() {
    return settingsBox.clear();
  }
}
