import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double circleProgress;

  CircleProgress({required this.circleProgress});

  @override
  void paint(Canvas canvas, Size size) {
    //I will draw circle
    Paint circle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 100;

    canvas.drawCircle(center, radius, circle);

    //I will draw animation
    Paint animationArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (circleProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CircleProgress oldDelegate) {
    return circleProgress != oldDelegate.circleProgress;
  }
}
