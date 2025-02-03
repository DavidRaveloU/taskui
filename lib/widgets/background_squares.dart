import 'package:flutter/material.dart';

class BackgroundSquares extends StatelessWidget {
  const BackgroundSquares({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: SquarePainter(),
        child: Container(),
      ),
    );
  }
}

class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(134, 224, 224, 224)
      ..style = PaintingStyle.fill;

    final squareSize = 4.0;
    final spacing = 54.0;

    final offsetX = (size.width % spacing) / 2;
    final offsetY = (size.height % spacing) / 2;

    for (double x = offsetX; x < size.width; x += spacing) {
      for (double y = offsetY; y < size.height; y += spacing) {
        canvas.drawRect(
          Rect.fromLTWH(x, y, squareSize, squareSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
