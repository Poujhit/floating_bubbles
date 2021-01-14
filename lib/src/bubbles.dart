import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'bubble_floating_animation.dart';
import 'bubble_painter.dart';

class Bubbles extends StatefulWidget {
  final int noOfBubbles;

  final Color colorOfBubbles;

  final double sizeFactor;

  Bubbles({
    @required this.noOfBubbles,
    @required this.colorOfBubbles,
    this.sizeFactor,
  });

  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> {
  final Random random = Random();

  final List<BubbleFloatingAnimation> bubbles = [];

  @override
  void initState() {
    for (int i = 0; i < widget.noOfBubbles; i++) {
      bubbles.add(BubbleFloatingAnimation(random));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      tween: ConstantTween(1),
      builder: (context, child, _) {
        _simulateBubbles();
        return CustomPaint(
          painter: BubbleModel(
            bubbles: bubbles,
            color: widget.colorOfBubbles,
            sizeFactor: widget.sizeFactor,
          ),
        );
      },
    );
  }

  _simulateBubbles() {
    bubbles.forEach((particle) => particle.checkIfParticleNeedsToBeRestarted());
  }
}
