import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';

class CardCity extends StatelessWidget {
  final MainWeather citydata;
  const CardCity({
    Key? key,
    required this.citydata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path = getWeatherBackgrounds(
        citydata.weatherData.current!.weather![0].id ?? 500);
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        citydata.cityName!,
                        style: normalTextTheme.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${citydata.weatherData.current!.temp!.kelvinToCelsius()}\u2103',
                        style: normalTextTheme.copyWith(
                            fontSize: 30, color: Colors.white),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/weatherSvg/cloudy.svg',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            citydata
                                .weatherData.current!.weather![0].description!,
                            style: normalTextTheme.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
