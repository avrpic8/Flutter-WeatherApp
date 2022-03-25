import 'package:flutter_weather/app/core/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'app_settings.g.dart';

@HiveType(typeId: 8)
class AppSettings extends HiveObject {
  @HiveField(0)
  bool unit;

  @HiveField(1)
  int autoUpdateTime;

  AppSettings({this.unit = false, this.autoUpdateTime = disable});
}
