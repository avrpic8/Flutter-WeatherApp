import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:get/state_manager.dart';

class SearchView extends GetView<SearchController> {
  final controller = Get.put(HomeController(repository: RepositoryImp(service: HttpService())));
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('hi1');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
            child: ElevatedButton(
          child: Text('press'),
          onPressed: () {
            SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(statusBarColor: Colors.amber));
          },
        )),
      ),
    );
  }
}
