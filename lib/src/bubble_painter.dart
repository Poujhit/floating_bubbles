import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'bubble_floating_animation.dart';

enum _OffsetProps { x, y }

class BubbleModel extends CustomPainter {
  List<BubbleFloatingAnimation> bubbles;
  Color color = Colors.white.withAlpha(30);
  double sizeFactor;
  BubbleModel({
    @required this.bubbles,
    @required this.color,
    this.sizeFactor = 0.2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    bubbles.forEach((particle) {
      final progress = particle.progress();
      final MultiTweenValues animation = particle.tween.transform(progress);
      final position = Offset(
        animation.get<double>(_OffsetProps.x) * size.width,
        animation.get<double>(_OffsetProps.y) * size.height,
      );
      canvas.drawCircle(position, size.width * sizeFactor * particle.size, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
