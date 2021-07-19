import 'package:flutter/material.dart';

import 'package:flutter_application_1/parametrs.dart';

class MyCheckBoxPaint extends CustomPainter {
  MyCheckBoxPaint(
      {required this.id,
      required this.check,
      required this.previos,
      required this.x});
  int id;
  int check, previos;
  double x;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = colors[id];
    paint.strokeWidth = 6;
    var center = Offset(size.width / 2, size.height / 2);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width / 3, paint);
    paint.color = Colors.white;
    if (id == previos) {
      paint.color = Colors.white;
      canvas.drawCircle(center, (size.width / 4) * x, paint);
    } else if (id == check) {
      paint.color = Colors.white;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(center, (size.width / 4) - size.width / 4 * x, paint);
      //check mark
      paint.strokeWidth = 3;
      paint.color = Colors.white;
      double x0 = size.width / 2, y0 = size.height / 2; //center for check mark
      double x1 = size.width / 3, y1 = size.height * 3 / 5.5; // left dot start
      double x2 = size.width / 2, y2 = size.height * 5 / 7.5;
      double x3 = size.width * 3 / 4, y3 = size.height * 4 / 9;

      var path = Path();
      paint.style = PaintingStyle.stroke;

      path.moveTo(x0 - ((x0 - x1) * x), size.height * 3 / 5.5);
      path.lineTo(x1 - ((x1 - x2) * x), y1 - (y1 - y2) * x);
      path.moveTo(x1 - ((x1 - x2) * x), y1 - (y1 - y2) * x);
      path.lineTo(x2 - ((x2 - x3) * x), y2 - (y2 - y3) * x);
      canvas.drawPath(path, paint);
    } else {
      paint.color = Colors.white;
      canvas.drawCircle(center, (size.width / 4), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
