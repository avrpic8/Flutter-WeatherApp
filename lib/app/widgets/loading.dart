import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool status;
  final Color color;
  final double width, height;
  final double mLeft, mRight, mTop, mBottom;
  const Loading({
    Key? key,
    required this.status,
    this.color = Colors.white,
    this.mLeft = 0,
    this.mRight = 0,
    this.mTop = 0,
    this.mBottom = 0,
    this.width = 10,
    this.height = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Center();
    } else {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(mLeft, mTop, mRight, mBottom),
          width: width,
          height: height,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 5,
          ),
        ),
      );
    }
  }
}
