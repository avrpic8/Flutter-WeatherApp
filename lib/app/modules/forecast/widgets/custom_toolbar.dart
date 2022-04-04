import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:get/get.dart';

class CustomToolbar extends StatelessWidget {
  const CustomToolbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: normalTextTheme.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
