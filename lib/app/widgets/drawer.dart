import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: primaryColor),
              child: Container(
                  // child: Image.asset(
                  //   'assets/images/background/header.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.location_searching,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'City manage',
                    style: normalTextTheme.copyWith(
                        color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.CITY_MANAGER);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Settings',
                    style: normalTextTheme.copyWith(
                        color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.SETTINGS);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.recent_actors,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'About',
                    style: normalTextTheme.copyWith(
                        color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Exit',
                    style: normalTextTheme.copyWith(
                        color: Colors.black87, fontSize: 16),
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
