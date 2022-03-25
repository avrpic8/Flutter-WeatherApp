import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/service/repository_imp.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool _unitFlag = false.obs;
  final RxInt _autoUpdateTime = disable.obs;
  late AppSettings? settings;

  final RepositoryImp repository;

  SettingsController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fillSettingsParameters();
  }

  bool get unitFlag => _unitFlag.value;

  int get autoUpdateTime => _autoUpdateTime.value;

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

  void fillSettingsParameters() async {
    settings = await repository.readSetting();
    _unitFlag.value = settings!.unit;
    _autoUpdateTime.value = settings!.autoUpdateTime;
  }
}
