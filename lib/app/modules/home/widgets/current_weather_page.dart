import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_weather/app/modules/home/widgets/refresh.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeatherPage extends StatelessWidget {
  final homeCtr = Get.find<HomeController>();
  final connectionCtr = Get.find<ConnectionController>();

  final MainWeather data;
  final int weatherArrayIndex;
  CurrentWeatherPage({
    Key? key,
    required this.data,
    required this.weatherArrayIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;
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
                                  style: dateCurrentWeather),
                            ),
                            Refresh(
                              onTap: () {
                                if (connectionCtr.connectionState !=
                                    noneInternet) {
                                  homeCtr.updateCurrentWeather(
                                      weather: data,
                                      weatherIndex: weatherArrayIndex);
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      height: deviceHeight * 0.25,
                      color: Colors.transparent,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.weatherData.current!.temp!.kelvinToCelsius()}\u2103',
                          style: GoogleFonts.lato(
                            fontSize: 85,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/weatherSvg/cloudy.svg',
                              width: 34,
                              height: 34,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              data.weatherData.current!.weather![0].description
                                  .capitalize(),
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 1.5,
                color: Colors.white30,
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              data.weatherData.current!.windSpeed!
                                  .toStringAsFixed(1),
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'm/sec',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Pressure',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              data.weatherData.current!.pressure.toString(),
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              ' hPa',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              data.weatherData.current!.humidity.toString(),
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '%',
                              style: GoogleFonts.lato(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: getSystemNavigationHeight(),
          )
        ],
      ),
    );
  }
}
