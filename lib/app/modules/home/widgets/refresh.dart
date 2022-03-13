import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Function() onTap;

  const Refresh({
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed: () => onTap(),
          icon: Icon(
            Icons.refresh,
            color: Colors.black.withOpacity(0.6),
            size: 15,
          ),
        ),
      ),
    );
  }
}
