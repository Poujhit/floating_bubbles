import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum _OffsetProps { x, y }

class BubbleFloatingAnimation {
  MultiTween<_OffsetProps> tween;
  double size;
  Duration duration;
  Duration startTime;
  Random random;

  BubbleFloatingAnimation(this.random) {
    _restart();
    _shuffle();
  }

  _restart() {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);

    tween = MultiTween<_OffsetProps>()
      ..add(_OffsetProps.x, Tween(begin: startPosition.dx, end: endPosition.dx))
      ..add(_OffsetProps.y, Tween(begin: startPosition.dy, end: endPosition.dy));

    duration = Duration(milliseconds: 3000) + Duration(milliseconds: random.nextInt(6000));
    startTime = Duration(milliseconds: DateTime.now().millisecondsSinceEpoch);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  void _shuffle() {
    startTime -= Duration(milliseconds: (this.random.nextDouble() * duration.inMilliseconds).round());
  }

  checkIfParticleNeedsToBeRestarted() {
    if (progress() == 1.0) {
      _restart();
    }
  }

  double progress() {
    return ((Duration(milliseconds: DateTime.now().millisecondsSinceEpoch).inMilliseconds - startTime.inMilliseconds) /
            duration.inMilliseconds)
        .clamp(0.0, 1.0)
        .toDouble();
  }
}

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
