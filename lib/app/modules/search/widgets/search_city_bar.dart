import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/modules/search/controllers/search_controller.dart';

class SearchCityBar extends StatelessWidget {
  final SearchController controller;
  final Function() onTap;

  const SearchCityBar({
    Key? key,
    required this.controller, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.editCtr,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.done,
            color: Colors.grey,
          ),
          onPressed: () => onTap(),
        ),
        hintText: 'Search',
        hintStyle: hintTextSearchStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.all(0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey.shade700,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please write your city name';
        }
        return null;
      },
    );
  }
}
