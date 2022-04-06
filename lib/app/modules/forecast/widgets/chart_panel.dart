import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:get/get.dart';

class ChartPanel extends StatelessWidget {
  const ChartPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ForecastController controller;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AspectRatio(
            aspectRatio: 2,
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(
                //color: Colors.amber,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: Obx(
                () => LineChart(
                  controller.getChartFlag
                      ? controller.maxTempData()
                      : controller.minTempData(),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 10,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: RotationTransition(
                    turns: controller.animation,
                    child: IconButton(
                      onPressed: () {
                        controller
                            .changeIconButtonAnimation();
                      },
                      icon: Icon(
                        Icons.change_history,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
                Text(
                  controller.getChartFlag
                      ? 'Maximum temp chart'
                      : 'Minimum temp chart',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
