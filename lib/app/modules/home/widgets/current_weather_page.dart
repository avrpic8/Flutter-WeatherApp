import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/home/controllers/current_weather_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/current_temp.dart';
import 'package:flutter_weather/app/modules/home/widgets/current_wph.dart';
import 'package:flutter_weather/app/modules/home/widgets/refresh.dart';
import 'package:get/get.dart';

class CurrentWeatherPage extends StatelessWidget {
  final MainWeather data;
  final controller = Get.put(CurrentWeatherController());
  CurrentWeatherPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;

    String path =
        getWeatherIcons(data.weatherData.current!.weather![0].id ?? 800);
    return Container(
      width: deviceWidth,
      height: deviceHeight,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Expanded(
                              child: Text(data.cityName!,
                                  style: cityNameCurrentWeather),
                            ),
                            Text(
                              data.weatherData.timezone!,
                              style:
                                  cityNameCurrentWeather.copyWith(fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  data.weatherData.current!.dt!.unixToDate(),
                                  style: cityNameCurrentWeather.copyWith(
                                      fontSize: 14)),
                            ),
                            Refresh(
                              onTap: () {
                                controller.updateCurrentWeather(weather: data);
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      height: deviceHeight * 0.28,
                      color: Colors.transparent,
                    ),
                    CurrentTemp(
                      currentTemp: data.weatherData.current!.temp,
                      iconPath: path,
                      description:
                          data.weatherData.current!.weather![0].description,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CurrentWhp(data: data.weatherData),
          SizedBox(
            height: getSystemNavigationHeight(),
          )
        ],
      ),
    );
  }
}
