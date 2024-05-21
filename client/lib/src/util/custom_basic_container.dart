import 'package:flutter/material.dart';

class CustomBasicContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double circularBorderRadius;
  final BoxBorder? border;
  final Widget child;
  const CustomBasicContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.circularBorderRadius,
    this.border,
    this.child = const SizedBox()
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border ?? Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(circularBorderRadius),
        color: color
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
