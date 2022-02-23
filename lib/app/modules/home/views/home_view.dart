import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = Get.width;
    final double deviceHeight = Get.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/night.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.18,
                        ),
                        Expanded(
                          child: Column(
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '24\u2103',
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
                        SizedBox(
                          height: deviceHeight * 0.12,
                        )
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
                      Row(
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
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Weather app'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.search,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/images/menu.svg',
            color: Colors.white,
            width: 30,
            height: 30,
          ),
        )
      ],
    );
  }
}
