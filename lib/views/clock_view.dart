import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class ClockView extends StatefulWidget {
  final double size;

  ClockView({this.size});
  
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
         
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width/20;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width/60;

    var minHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77D0FF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width/30;

    var hourHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width/24;

      var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius*0.75, fillBrush);
    canvas.drawCircle(center, radius*0.75, outlineBrush);

    var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    var minX = centerX + radius * 0.6 *cos(dateTime.minute * 6 * pi / 180);
    var minY = centerY + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minX, minY), minHandBrush);

    var hourX = centerX +
         radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerY +
         radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourX, hourY), hourHandBrush);
    canvas.drawCircle(center, radius * 0.12, centerFillBrush);
    
    var outerCircle = radius;
    var innerCircle = radius * 0.9;
    for (int i = 0; i<360; i+=12)  {
      var x1 = centerX + outerCircle * cos(i * pi / 180);
      var y1 = centerX + outerCircle * sin(i * pi / 180);

      var x2 =  centerX + innerCircle * cos(i * pi / 180);
      var y2 =  centerX + innerCircle * sin(i * pi / 180);
      canvas.drawLine(Offset(x1,y1), Offset(x2,y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
