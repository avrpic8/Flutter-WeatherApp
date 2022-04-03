import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/core/Carousel/carousel_slider.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/forecast/controllers/forecast_controller.dart';
import 'package:flutter_weather/app/widgets/my_app_bar.dart';
import 'package:get/state_manager.dart';

class ForecastView extends GetView<ForecastController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Seven Days Forecast'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: controller.dataForecast.weatherData.daily!.length,
              itemBuilder: (context, index, realIndex) {
                String iconPath = getWeatherIcons(controller
                    .dataForecast.weatherData.daily![index].weather![0].id!);
                String imagePath = getWeatherBackgrounds(800);
                return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            iconPath,
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                viewportFraction: 0.55,
                aspectRatio: 1.4,
                disableCenter: true,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
            )
          ],
        ),
      ),
    );
  }
}


//controller.dataForecast.weatherData.daily![1].weather![0].id!