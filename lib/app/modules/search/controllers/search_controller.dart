import 'package:flutter/material.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final homeCtr = Get.find<HomeController>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController editCtr = TextEditingController();

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
