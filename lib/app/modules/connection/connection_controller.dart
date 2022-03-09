import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  RxInt connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    super.onClose();
    _subscription.cancel();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = wifiInternet;
        break;

      case ConnectivityResult.mobile:
        connectionStatus.value = mobileInternet;
        break;

      case ConnectivityResult.none:
        connectionStatus.value = noneInternet;
        break;

      default:
        Get.snackbar("Network Error: ", "Failed to get network connection");
        break;
    }
  }
}
