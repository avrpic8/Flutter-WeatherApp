import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxBool _unitFlag = false.obs;
  final RxBool _autoUpdateFlag = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RxBool get unitFlag => _unitFlag;

  RxBool get autoUpdateFlag => _autoUpdateFlag;

  void setUnitFlag(bool value) {
    _unitFlag.value = value;
  }

  void setautoUpdateFlag(bool value) {
    _autoUpdateFlag.value = value;
  }
}
