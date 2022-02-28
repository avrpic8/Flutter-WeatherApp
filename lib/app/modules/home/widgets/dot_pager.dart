import 'package:flutter/material.dart';

class DotPager extends StatelessWidget {
  final int dotCount;
  final int currentIndex;
  const DotPager({
    Key? key,
    required this.dotCount, required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 5,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}