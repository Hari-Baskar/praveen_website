import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:praveen_website/core/styles/app_size.dart';
import 'package:praveen_website/core/themes/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    final double logoSize = size ?? AppSize.iconMedium;
    
    return SizedBox(
      width: logoSize,
      height: logoSize,
      child: CustomPaint(
        painter: _PentagonOutlinePainter(
          color: AppColors.buttonColor,
          strokeWidth: logoSize * 0.1,
        ),
      ),
    );
  }
}

class _PentagonOutlinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _PentagonOutlinePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Path path = Path();

    for (int i = 0; i < 5; i++) {
      final double angle = (i * 2 * math.pi / 5) - (math.pi / 2);
      final double x = center.dx + radius * math.cos(angle);
      final double y = center.dy + radius * math.sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
