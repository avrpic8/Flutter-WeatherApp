import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/citymanager/controllers/city_manager_controller.dart';
import 'package:flutter_weather/app/modules/citymanager/widgets/card_city.dart';
import 'package:flutter_weather/app/widgets/emptyState.dart';
import 'package:get/get.dart';

class CityManagerView extends GetView<CityManagerController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.saveAndExit(controller.tempList),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryContainerColor,
            statusBarIconBrightness: Brightness.light,
          ),
          title: Text(
            'City Manager',
            style: normalTextTheme.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder(
                builder: (CityManagerController controller) {
                  if (controller.tempList.isNotEmpty) {
                    return ReorderableListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      onReorder: (int oldIndex, int newIndex) {
                        controller.reorderWeatherListCity(oldIndex, newIndex);
                      },
                      children: [
                        ...controller.tempList.map(
                          (data) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) async {
                                await controller.removeCity(data, context);
                              },
                              background: Container(
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.delete_sweep,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              child: CardCity(citydata: data),
                            );
                          },
                        ).toList()
                      ],
                    );
                  } else {
                    return EmptyState(
                      textEmpty: 'You dont have any cities',
                      iconColor: Colors.grey,
                      textColor: Colors.grey,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
