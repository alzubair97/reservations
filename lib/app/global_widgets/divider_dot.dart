import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DividerDash extends StatelessWidget {
  final double? dashSpace;
  final double? dashWidth;
  final Color? color;
  final double? width;

  const DividerDash(
      {Key? key, this.width, this.dashSpace, this.dashWidth, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 100.w,
        child: CustomPaint(
            painter: DashedLinePainter(
          dashSpace: dashSpace ?? 2,
          dashWidth: dashWidth ?? 1,
          color: color ?? Colors.grey[600]!,
        )));
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 2;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashedLinePainter extends CustomPainter {
  double dashWidth;
  double dashSpace;
  Color color;
  DashedLinePainter(
      {this.dashSpace = 5, this.dashWidth = 9, this.color = Colors.grey});
  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
