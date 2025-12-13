import 'package:flutter/material.dart';

class ArrowButtonWithArc extends StatelessWidget {
  final VoidCallback? onTap;

  const ArrowButtonWithArc({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Arc behind the button
          // Positioned(
          //   top: -10,
          //   child: CustomPaint(painter: ArcPainter(), size: const Size(80, 80)),
          // ),

          // Circle button
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFF6A623), Color(0xFFEA8C0D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.grey.shade400
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final Rect arcRect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2 + 10),
      radius: 40,
    );

    // Draw top arc
    canvas.drawArc(
      arcRect,
      3.8, // start angle (radians)
      2.2, // sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
