import 'package:flutter/material.dart';
import "dart:math";

const double LETTER_RATIO = (1 / 5);
const double SPEED_RATIO = 0.2708;
const double METERS_PER_SECOND_RATIO = 0.11875;
const double BORDER_LINE_HEIGHT_RATIO = 0.05521;
const double BORDER_LINE_WIDTH_RATIO = 0.0083333;
const double TRIANGLE_HEIGHT_RATIO = 0.05221;
const double TRIANGLE_LINE_WIDTH_RATIO = 0.035;
const double NEEDLE_WIDTH_RATIO = 0.0085;
const double NEEDLE_HEIGHT_RATIO = 0.4054;
const double NEEDLE_CIRLCE_RADIUS_RATIO = (0.0333);

/// TO JOIN THE CIRCLE WITH THE BOTTOM NEEDLE SHAFT

class WindCompass extends StatelessWidget {
  const WindCompass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Center(
        child: Text(''),
      ),
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
    var needleLength = radius - (size.height * NEEDLE_HEIGHT_RATIO);
    var angleTest = 253;
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
    var y1 = centerX - outerCircleRadius * sin(13 * pi / 180);

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
    x1 = centerX + outerCircleRadius * cos(98 * pi / 180);
    y1 = centerX - outerCircleRadius * sin(58 * pi / 180);
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
    y1 = centerX - outerCircleRadius * sin(13 * pi / 180);
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
    y1 = centerX + outerCircleRadius * sin(23 * pi / 180);
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
    //////////Compass Needle.

    var needleBrush = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 1)
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height * NEEDLE_WIDTH_RATIO;

    x1 = centerX + (innerCircleRadius) * cos(angleTest * pi / 180);
    y1 = centerX + (innerCircleRadius) * sin(angleTest * pi / 180);

    /// Needle Point
    var pointPath = Path();
    pointPath.moveTo(x1, y1);
    x1 = centerX +
        (innerCircleRadius - (size.height * 0.016)) *
            cos((angleTest - 5) * pi / 180);
    y1 = centerX +
        (innerCircleRadius - (size.height * 0.016)) *
            sin((angleTest - 5) * pi / 180);
    pointPath.lineTo(x1, y1);
    x1 = centerX +
        (innerCircleRadius + (size.height * 0.06)) * cos(angleTest * pi / 180);
    y1 = centerX +
        (innerCircleRadius + (size.height * 0.06)) * sin(angleTest * pi / 180);
    pointPath.lineTo(x1, y1);
    x1 = centerX +
        (innerCircleRadius - (size.height * 0.016)) *
            cos((angleTest + 5) * pi / 180);
    y1 = centerX +
        (innerCircleRadius - (size.height * 0.016)) *
            sin((angleTest + 5) * pi / 180);
    pointPath.lineTo(x1, y1);
    x1 = centerX + (innerCircleRadius) * cos(angleTest * pi / 180);
    y1 = centerX + (innerCircleRadius) * sin(angleTest * pi / 180);
    pointPath.lineTo(x1, y1);
    canvas.drawPath(pointPath, trianglePainter);

    //// Needle Body
    x1 = centerX + (innerCircleRadius) * cos((angleTest + 180) * pi / 180);
    y1 = centerX + (innerCircleRadius) * sin((angleTest + 180) * pi / 180);
    pointPath.lineTo(x1, y1);
    canvas.drawPath(pointPath, needleBrush);

    /// Needle Circle
    x1 = centerX + outerCircleRadius * cos((angleTest + 180) * pi / 180);
    y1 = centerX + outerCircleRadius * sin((angleTest + 180) * pi / 180);
    pointPath.arcToPoint(Offset(x1, y1), radius: Radius.circular(2));
    canvas.drawPath(pointPath, needleBrush);
    x1 = centerX + innerCircleRadius * cos((angleTest + 180) * pi / 180);
    y1 = centerX + innerCircleRadius * sin((angleTest + 180) * pi / 180);
    pointPath.arcToPoint(Offset(x1, y1), radius: Radius.circular(2));
    canvas.drawPath(pointPath, needleBrush);
  }

  @override
  bool shouldRepaint(CompassPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CompassPainter oldDelegate) => false;
}
