import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';
import 'package:mapbox_search/mapbox_search.dart';

class PlaceSearchCard extends StatelessWidget {
  const PlaceSearchCard({
    Key? key,
    required this.place,
    required this.controller,
  }) : super(key: key);

  final SearchController controller;
  final MapBoxPlace place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        controller.getUserCityAndExit(context, place.text!);
      },
      child: Card(
        child: ListTile(
          title: Text(
            place.placeName!,
            style: normalTextTheme.copyWith(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
