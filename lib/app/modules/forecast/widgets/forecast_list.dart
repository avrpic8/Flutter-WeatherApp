import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/Carousel/carousel_slider.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/forecast/widgets/forecast_Item.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({
    Key? key,
    required this.forecastData,
  }) : super(key: key);

  final MainWeather forecastData;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: forecastData.weatherData.daily!.length,
      itemBuilder: (context, index, realIndex) {
        return ForecastItem(
          dayIndex: index,
          forecastData: forecastData,
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        viewportFraction: 0.4,
        aspectRatio: 2,
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
      ),
    );
  }
}
