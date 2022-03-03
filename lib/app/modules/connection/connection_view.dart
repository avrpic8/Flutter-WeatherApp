import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:get/get.dart';

class ConnectionView extends GetView<ConnectionController> {
  const ConnectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String connectionState = '';
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Obx(
        () {
          if (controller.connectionStatus.value == 1 || controller.connectionStatus.value == 2) {
            connectionState = 'Online';
          }else{
            connectionState = 'Offline';
          }
          return Text(
            connectionState,
            style: connectionStatus,
          );
        },
      ),
    );
  }
}
