import 'package:flutter/material.dart';

class ReusableIconButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final BorderRadius radius;
  final Function() onTap;

  const ReusableIconButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.icon,
    this.iconSize = 15,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: radius,
        ),
        child: IconButton(
          onPressed: () => onTap(),
          icon: Icon(
            icon,
            color: Colors.black.withOpacity(0.6),
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
