import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_search/mapbox_search.dart';

class SearchController extends GetxController {
  final mainCtr = Get.find<MainController>();
  final settingCtr = Get.find<SettingsController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController editCtr = TextEditingController();
  RxList<MapBoxPlace> places = <MapBoxPlace>[].obs;
  late final PlacesSearch placeSearch;

  @override
  void onInit() async {
    super.onInit();
    placeSearch = PlacesSearch(
      apiKey: mapBoxApiKey,
      limit: 5,
    );
  }

  void searchPlaces(String query) async {
    mainCtr.enableLoading();
    List<MapBoxPlace>? listPlace = await placeSearch.getPlaces(query);
    mainCtr.disableLoading();
    places.assignAll(listPlace!);
    print(places);
  }

  void getUserCityAndExit(BuildContext context, String city) async {
    MainWeather weather = await mainCtr.getWeatherByCityName(cityName: city);
    mainCtr.storeData(context, weather);
    shouldShowNotification(
      settingController: settingCtr,
      mainController: mainCtr,
    );
    Navigator.of(context).pop();
  }

  void getUserPostionAndExit(BuildContext context) async {
    final snackBar = SnackBar(
      content: Text(
        'Your request is being processed',
        style: normalTextTheme.copyWith(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Position position = await _getPosition();
    MainWeather weather = await mainCtr.getWeatherByGpsData(
        lat: position.latitude.toString(), lon: position.longitude.toString());
    mainCtr.storeData(context, weather);
    shouldShowNotification(
      settingController: settingCtr,
      mainController: mainCtr,
    );
    Navigator.of(context).pop();
  }

  Future<Position> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openAppSettings();
      //return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _realeseControllers() {
    editCtr.clear();
    editCtr.dispose();
  }

  @override
  void onClose() {
    _realeseControllers();
    super.onClose();
  }
}
