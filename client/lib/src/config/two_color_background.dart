import 'package:flutter/material.dart';

class TwoColorBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 상단 밝은 색 부분 그리기
    Paint lightPaint = Paint()
      ..color = Color(0xFFEEEAE6) // 밝은 색
      ..style = PaintingStyle.fill;

    Path lightPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.45)
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.55,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.45,
        0,
        size.height * 0.55,
      )
      ..close();

    canvas.drawPath(lightPath, lightPaint);

    // 하단 어두운 색 부분 그리기
    Paint darkPaint = Paint()
      ..color = Color(0xFF4C433F) // 어두운 색
      ..style = PaintingStyle.fill;

    Path darkPath = Path()
      ..moveTo(size.width, size.height * 0.45)
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.55,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.45,
        0,
        size.height * 0.55,
      )
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(darkPath, darkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}