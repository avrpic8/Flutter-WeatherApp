import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeatherPage extends StatelessWidget {
  final WeatherData data;
  const CurrentWeatherPage({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = Get.height;

    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: deviceHeight * 0.16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Esfahan',
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '07:50 PM- Modndey, 9 nov 2022',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Divider(
                  height: deviceHeight * 0.35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.current!.temp.toString(),//'24\u2103',
                      style: GoogleFonts.lato(
                        fontSize: 85,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/moon.svg',
                          width: 34,
                          height: 34,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Night',
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
                        Text(
                          '10',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'km/h',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 10,
                              color: Colors.greenAccent,
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Rain',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '2',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 10,
                              color: Colors.blueAccent,
                            )
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
                        Text(
                          '10',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                              fontSize: 12, color: Colors.white),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 35,
                              color: Colors.redAccent,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
