import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/daily.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:get/get.dart';

class ForecastController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late MainWeather dataForecast;
  late AnimationController animationController;
  late Animation<double> animation;
  int randomBackGroundColorNumber = 0;
  RxBool chartFlag = false.obs;
  List<int> tempMaxList = [];
  List<int> tempMinList = [];

  bool get getChartFlag => chartFlag.value;

  void setChartFlag(bool newValue) {
    chartFlag.value = newValue;
  }

  double getMaxTempMargin(List<int> listTemp) {
    var maxMargin = listTemp.reduce(max);
    return maxMargin + (maxMargin * 0.6);
  }

  double getMinTempMargin(List<int> listTemp) {
    var minMargin = listTemp.reduce(min);
    return minMargin + (minMargin * 0.6);
  }

  @override
  void onInit() {
    super.onInit();

    var rand = Random();
    randomBackGroundColorNumber = rand.nextInt(15);
    setupAnimationIconButton();
    initTempList();
  }

  void setupAnimationIconButton() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  void initTempList() {
    dataForecast = Get.arguments;

    List<Daily>? listDay = dataForecast.weatherData.daily;
    for (var item in listDay!) {
      var tempMax = int.parse(item.temp!.max!.kelvinToCelsius());
      var tempMin = int.parse(item.temp!.min!.kelvinToCelsius());
      tempMaxList.add(tempMax);
      tempMinList.add(tempMin);
    }
  }

  void changeIconButtonAnimation() {
    if (getChartFlag) {
      animationController.reverse(from: 0.5);
    } else {
      animationController.forward(from: 0.0);
    }
    setChartFlag(!getChartFlag);
  }

  LineChartData maxTempData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 5,
        verticalInterval: 5,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
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
            //getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            //getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 40,
      minY: -10,
      maxY: getMaxTempMargin(tempMaxList),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, tempMaxList[0].toDouble()),
            FlSpot(10, tempMaxList[1].toDouble()),
            FlSpot(15, tempMaxList[2].toDouble()),
            FlSpot(20, tempMaxList[3].toDouble()),
            FlSpot(25, tempMaxList[4].toDouble()),
            FlSpot(30, tempMaxList[5].toDouble()),
            FlSpot(35, tempMaxList[6].toDouble()),
            FlSpot(40, tempMaxList[7].toDouble()),
          ],
          isCurved: true,
          color: Colors.white.withOpacity(0.6),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }

  LineChartData minTempData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 5,
        verticalInterval: 5,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
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
            //getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            //getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: 40,
      minY: -10,
      maxY: getMaxTempMargin(tempMinList),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, tempMinList[0].toDouble()),
            FlSpot(10, tempMinList[1].toDouble()),
            FlSpot(15, tempMinList[2].toDouble()),
            FlSpot(20, tempMinList[3].toDouble()),
            FlSpot(25, tempMinList[4].toDouble()),
            FlSpot(30, tempMinList[5].toDouble()),
            FlSpot(35, tempMinList[6].toDouble()),
            FlSpot(40, tempMinList[7].toDouble()),
          ],
          isCurved: true,
          color: Colors.white.withOpacity(0.6),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
        ),
      ],
    );
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
