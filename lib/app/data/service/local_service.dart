import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalService extends GetxService {
  final Box<MainWeather> box;

  LocalService({required this.box});

  Future<MainWeather> createOrUpdateWeather(MainWeather data) async{
    if (data.isInBox) {
      data.save();
    } else {
      await box.add(data);
    }
    return data;
  }

  Future<List<MainWeather>> getAllWeather() async{
    return box.values.toList();
  }

  Future<void> deleteAllWeather() {
    return box.clear();
  }
}
