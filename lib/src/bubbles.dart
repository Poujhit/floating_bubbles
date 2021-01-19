import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'bubble_floating_animation.dart';

/// Creates Floating Bubbles in the Foreground of Any [widgets].
class FloatingBubbles extends StatefulWidget {
  /// Number of Bubbles to be shown per second. Should be [> 10] and not [null].
  final int noOfBubbles;

  /// Add Color to the Bubble
  ///
  /// For example colorOfBubbles = Colors.white.withAlpha(30);
  /// .withAlpha will give a lighter shade to the bubbles.
  final Color colorOfBubbles;

  /// Add Size Factor to the bubbles
  ///
  /// Typically it should be > 0 and < 0.5. Otherwise the bubble size will be too large.
  final double sizeFactor;

  /// Creates Floating Bubbles in the Foreground to Any widgets.
  ///
  /// All Fields Are Required to make a new [Instance] of Bubbles.
  FloatingBubbles({
    @required this.noOfBubbles,
    @required this.colorOfBubbles,
    @required this.sizeFactor,
  })  : assert(
          noOfBubbles != null || noOfBubbles > 10,
          'Number of Bubbles Cannot be nulland not less than 10',
        ),
        assert(
          colorOfBubbles != null,
          'Color of the bubble cannot be null',
        ),
        assert(sizeFactor != null && sizeFactor > 0 && sizeFactor < 0.5);

  @override
  _FloatingBubblesState createState() => _FloatingBubblesState();
}

class _FloatingBubblesState extends State<FloatingBubbles> {
  /// Creating a Random object.
  final Random random = Random();

  /// initialises a empty list of bubbles.
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
    /// Creates a Loop Animation of Bubbles that float around the screen from bottom to top.
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

  /// This Function checks whether the bubbles in the screen have to be restarted due to
  /// frame skips.
  _simulateBubbles() {
    bubbles.forEach((bubbles) => bubbles.checkIfBubbleNeedsToBeRestarted());
  }
}
