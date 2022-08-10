import 'package:flutter/material.dart';
import "dart:math";

const double LETTER_RATIO = (1 / 6);
const double SPEED_RATIO = 0.2708;
const double METERS_PER_SECOND_RATIO = 0.11875;
const double BORDER_LINE_HEIGHT_RATIO = 0.05521;
const double BORDER_LINE_WIDTH_RATIO = 0.0083333;
const double TRIANGLE_HEIGHT_RATIO = 0.05221;
const double TRIANGLE_LINE_WIDTH_RATIO = 0.04;

class WindCompass extends StatelessWidget {
  const WindCompass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CompassPainter(),
    );
  }
}

class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sizeOfCont = size.height;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = min(centerX, centerY);
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - (size.height * BORDER_LINE_HEIGHT_RATIO);
    double? fontS = size.height * LETTER_RATIO;

    var dashBrush = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.5)
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * BORDER_LINE_WIDTH_RATIO;
    //Draws Border lines
    for (double i = 0; i < 360; i += 3) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
    //x and y lines for alighment while testing

    // canvas.drawLine(Offset(size.width / 2, 0),
    //     Offset(size.width / 2, size.height), dashBrush);

    // canvas.drawLine(Offset(0, size.height / 2),
    //     Offset(size.width, size.height / 2), dashBrush);

    // East Letter

    var x1 = centerX + outerCircleRadius * cos(60 * pi / 180);
    var y1 = centerX - outerCircleRadius * sin(10 * pi / 180);

    final textPainterE = TextPainter(
        text: TextSpan(
          text: 'E',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: fontS,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainterE.layout();
    var offset = Offset(x1, y1);
    textPainterE.paint(canvas, offset);

    //North letter
    x1 = centerX + outerCircleRadius * cos(97 * pi / 180);
    y1 = centerX - outerCircleRadius * sin(60 * pi / 180);
    final textPainterN = TextPainter(
        text: TextSpan(
          text: 'N',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: fontS,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainterN.layout();
    offset = Offset(x1, y1);
    textPainterN.paint(canvas, offset);

    //West letter
    x1 = centerX - outerCircleRadius * cos(40 * pi / 180);
    y1 = centerX - outerCircleRadius * sin(10 * pi / 180);
    final textPainterW = TextPainter(
        text: TextSpan(
          text: 'W',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: fontS,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainterW.layout();
    offset = Offset(x1, y1);
    textPainterW.paint(canvas, offset);

    //South letter
    x1 = centerX + outerCircleRadius * cos(97 * pi / 180);
    y1 = centerX + outerCircleRadius * sin(30 * pi / 180);
    final textPainterS = TextPainter(
        text: TextSpan(
          text: 'S',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: fontS,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    textPainterS.layout();
    offset = Offset(x1, y1);
    textPainterS.paint(canvas, offset);

    // Triangle at the top of compass
    Paint trianglePainter = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width / 2, 0);

    path.lineTo(size.width / 2 - (size.width * TRIANGLE_LINE_WIDTH_RATIO),
        size.height * TRIANGLE_HEIGHT_RATIO);
    path.lineTo(size.width / 2 + (size.width * TRIANGLE_LINE_WIDTH_RATIO),
        size.height * TRIANGLE_HEIGHT_RATIO);
    path.close();

    canvas.drawPath(path, trianglePainter);

    //Middle Text
    x1 = centerX + outerCircleRadius * cos(108 * pi / 180);
    y1 = centerX - outerCircleRadius * sin(23 * pi / 180);
    final speedPT1 = TextPainter(
        text: TextSpan(
          text: '10',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: size.height * SPEED_RATIO,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    speedPT1.layout();
    offset = Offset(x1, y1);
    speedPT1.paint(canvas, offset);
    x1 = centerX + outerCircleRadius * cos(100 * pi / 180);
    y1 = centerX - outerCircleRadius * sin(190 * pi / 180);
    final speedPT2 = TextPainter(
        text: TextSpan(
          text: 'm/s',
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w600,
            fontSize: size.height * METERS_PER_SECOND_RATIO,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center);
    speedPT2.layout();
    offset = Offset(x1, y1);
    speedPT2.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CompassPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CompassPainter oldDelegate) => false;
}
