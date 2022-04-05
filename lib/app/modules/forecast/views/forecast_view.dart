import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/custom_toolbar.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/forecast_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ForecastView extends GetView<ForecastController> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  HexColor.fromHex('#de6262'),
                  HexColor.fromHex('#ffb88c'),
                ],
              ),
            ),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          Column(
            children: [
              CustomToolbar(title: 'Seven Days Forecast'),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height - 76,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.7,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                  ),
                                  child: LineChart(
                                    mainData(),
                                  ),
                                ),
                              ),
                              // AspectRatio(
                              //   aspectRatio: 3,
                              //   child: Container(
                              //     padding: EdgeInsets.only(left: 10, right: 10),
                              //     decoration: const BoxDecoration(
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(18),
                              //       ),
                              //     ),
                              //     child: LineChart(
                              //       mainData(),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white70,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${controller.dataForecast.cityName!}   City',
                                    style: normalTextTheme.copyWith(
                                      color: Colors.white70,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ForecastList(
                                forecastData: controller.dataForecast,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 10,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 35,
      minY: 0,
      maxY: controller.maxTempr,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, controller.tempList[0].toDouble()),
            FlSpot(10, controller.tempList[1].toDouble()),
            FlSpot(15, controller.tempList[2].toDouble()),
            FlSpot(20, controller.tempList[3].toDouble()),
            FlSpot(25, controller.tempList[4].toDouble()),
            FlSpot(30, controller.tempList[5].toDouble()),
            //FlSpot(35, double.parse(controller.tempList[6])),
          ],
          isCurved: true,
          color: Colors.white,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
