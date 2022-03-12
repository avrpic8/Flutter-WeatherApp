import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  final RxInt _connectionStatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;

  int get connectionState => _connectionStatus.value;

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
        _connectionStatus.value = wifiInternet;
        break;

      case ConnectivityResult.mobile:
        _connectionStatus.value = mobileInternet;
        break;

      case ConnectivityResult.none:
        _connectionStatus.value = noneInternet;
        break;

      default:
        Get.snackbar("Network Error: ", "Failed to get network connection");
        break;
    }
  }
}
