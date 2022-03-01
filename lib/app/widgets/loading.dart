import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool status;
  const Loading({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Center();
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
