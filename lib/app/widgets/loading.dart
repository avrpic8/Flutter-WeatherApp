import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool dataLoaded;
  const Loading({Key? key, required this.dataLoaded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dataLoaded) {
      return Center();  
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );     
    }
  }
}
