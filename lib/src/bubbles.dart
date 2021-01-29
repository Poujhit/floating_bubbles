import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'bubble_floating_animation.dart';

/// Creates Floating Bubbles in the Foreground of Any [widgets].
// ignore: must_be_immutable
class FloatingBubbles extends StatefulWidget {
  /// Number of Bubbles to be shown per second. Should be [> 10] and not [null].
  /// Whenever this value is changed, do a **Hot Restart** to see the Changes.
  final int noOfBubbles;

  /// Add Color to the Bubble
  ///
  /// For example `colorOfBubbles = Colors.white.withAlpha(30).`\
  ///`withAlpha(30)` will give a lighter shade to the bubbles.
  final Color colorOfBubbles;

  /// Add Size Factor to the bubbles
  ///
  /// Typically it should be > 0 and < 0.5. Otherwise the bubble size will be too large.
  final double sizeFactor;

  /// Number of [Seconds] the animation needs to draw on the screen.
  /// If you want the bubbles to be floating always then use the constructor
  /// `FloatingBubbles.alwaysRepeating()`.
  int duration;

  /// Creates Floating Bubbles in the Foreground to Any widgets that plays for [duration] amount of time.
  ///
  /// All Fields Are Required to make a new [Instance] of FloatingBubbles.
  /// If you want the bubbles to be floating always then use the constructor
  /// `FloatingBubbles.alwaysRepeating()`.
  FloatingBubbles({
    @required this.noOfBubbles,
    @required this.colorOfBubbles,
    @required this.sizeFactor,
    @required this.duration,
  })  : assert(
          noOfBubbles != null && noOfBubbles >= 10,
          'Number of Bubbles Cannot be null and not less than 10',
        ),
        assert(
          colorOfBubbles != null,
          'Color of the bubble cannot be null',
        ),
        assert(
          sizeFactor != null && sizeFactor > 0 && sizeFactor < 0.5,
          'Size factor cannot be null or greater than 0.5 or less than 0',
        ),
        assert(
          duration >= 0 && duration != null,
        );

  /// Creates Floating Bubbles that always floats and doesn't stop.
  /// All Fields Are Required to make a new [Instance] of FloatingBubbles.
  FloatingBubbles.alwaysRepeating({
    @required this.noOfBubbles,
    @required this.colorOfBubbles,
    @required this.sizeFactor,
  })  : assert(
          noOfBubbles != null && noOfBubbles >= 10,
          'Number of Bubbles Cannot be null and not less than 10',
        ),
        assert(
          colorOfBubbles != null,
          'Color of the bubble cannot be null',
        ),
        assert(
          sizeFactor != null && sizeFactor > 0 && sizeFactor < 0.5,
          'Size factor cannot be null or greater than 0.5 or less than 0',
        ) {
    duration = 0;
  }

  @override
  _FloatingBubblesState createState() => _FloatingBubblesState();
}

class _FloatingBubblesState extends State<FloatingBubbles> {
  /// Creating a Random object.
  final Random random = Random();

  ///if [this] value is 0, animation is played, else animation is stopped.
  ///Value of this is never changed when the duration is zero.
  int checkToStopAnimation = 0;

  /// initialises a empty list of bubbles.
  final List<BubbleFloatingAnimation> bubbles = [];

  @override
  void initState() {
    for (int i = 0; i < widget.noOfBubbles; i++) {
      bubbles.add(BubbleFloatingAnimation(random));
    }
    if (widget.duration != 0 && widget.duration != null)
      Timer(Duration(seconds: widget.duration), () {
        setState(() {
          checkToStopAnimation = 1;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Creates a Loop Animation of Bubbles that float around the screen from bottom to top.
    /// If [duration] is 0, then the animation loops itself again and again.
    /// If [duration] is not 0, then the animation plays till the duration and stops.
    return widget.duration == 0 && widget.duration != null
        ? LoopAnimation(
            tween: ConstantTween(1),
            builder: (context, child, value) {
              _simulateBubbles();

              return CustomPaint(
                painter: BubbleModel(
                  bubbles: bubbles,
                  color: widget.colorOfBubbles,
                  sizeFactor: widget.sizeFactor,
                ),
              );
            },
          )
        : PlayAnimation(
            duration: checkToStopAnimation == 0
                ? Duration(seconds: widget.duration)
                : Duration.zero,
            tween: ConstantTween(1),
            builder: (context, child, value) {
              _simulateBubbles();
              if (checkToStopAnimation == 0)
                return CustomPaint(
                  painter: BubbleModel(
                    bubbles: bubbles,
                    color: widget.colorOfBubbles,
                    sizeFactor: widget.sizeFactor,
                  ),
                );
              else
                return Container();
            },
          );
  }

  /// This Function checks whether the bubbles in the screen have to be restarted due to
  /// frame skips.
  _simulateBubbles() {
    bubbles.forEach((bubbles) => bubbles.checkIfBubbleNeedsToBeRestarted());
  }
}
