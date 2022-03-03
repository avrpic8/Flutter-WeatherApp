import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool status;
  final double mLeft, mRight, mTop, mBottom;
  const Loading(
      {Key? key,
      required this.status,
      this.mLeft = 0,
      this.mRight = 0,
      this.mTop = 0,
      this.mBottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Center();
    } else {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(mLeft, mTop, mRight, mBottom),
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 5,
          ),
        ),
      );
    }
  }
}
