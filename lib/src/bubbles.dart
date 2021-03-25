import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'bubble_floating_animation.dart';

///Enum for Setting the Shape of the bubble
enum BubbleShape { circle, square, roundedRectangle }

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
  int? duration;

  /// Opacity of the bubbles. Can take the value between 0 to 255.
  final int opacity;

  /// Painting Style of the bubbles.
  final PaintingStyle paintingStyle;

  /// Stroke Width of the bubbles. This value is effective only if [Painting Style]
  /// is set to [PaintingStyle.stroke].
  final double strokeWidth;

  /// Shape of the Bubble. Default value is [BubbleShape.circle]
  final BubbleShape shape;

  /// Creates Floating Bubbles in the Foreground to Any widgets that plays for [duration] amount of time.
  ///
  /// All Fields Are Required to make a new [Instance] of FloatingBubbles.
  /// If you want the bubbles to be floating always then use the constructor
  /// `FloatingBubbles.alwaysRepeating()`.
  FloatingBubbles({
    required this.noOfBubbles,
    required this.colorOfBubbles,
    required this.sizeFactor,
    required this.duration,
    this.shape = BubbleShape.circle,
    this.opacity = 100,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 0,
  })  : assert(
          noOfBubbles >= 10,
          'Number of Bubbles Cannot be less than 10',
        ),
        assert(
          sizeFactor > 0 && sizeFactor < 0.5,
          'Size factor cannot be greater than 0.5 or less than 0',
        ),
        assert(duration != null && duration >= 0,
            'duration should not be null or less than 0.'),
        assert(
          opacity >= 0 && opacity <= 255,
          'opacity value should be between 0 and 255 inclusive.',
        );

  /// Creates Floating Bubbles that always floats and doesn't stop.
  /// All Fields Are Required to make a new [Instance] of FloatingBubbles.
  FloatingBubbles.alwaysRepeating({
    required this.noOfBubbles,
    required this.colorOfBubbles,
    required this.sizeFactor,
    this.shape = BubbleShape.circle,
    this.opacity = 60,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 0,
  })  : assert(
          noOfBubbles >= 10,
          'Number of Bubbles Cannot be less than 10',
        ),
        assert(
          sizeFactor > 0 && sizeFactor < 0.5,
          'Size factor cannot be greater than 0.5 or less than 0',
        ),
        assert(
          opacity >= 0 && opacity <= 255,
          'opacity value should be between 0 and 255 inclusive.',
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
    if (widget.duration != null && widget.duration != 0)
      Timer(Duration(seconds: widget.duration!), () {
        setState(() {
          checkToStopAnimation = 1;
        });
      });
    super.initState();
  }

  /// Function to paint the bubbles to the screen.
  /// This is call the paint function in bubbles_floating_animation.dart.
  CustomPaint drawBubbles({required CustomPainter bubbles}) {
    return CustomPaint(
      painter: bubbles,
    );
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
              return drawBubbles(
                bubbles: BubbleModel(
                  bubbles: bubbles,
                  color: widget.colorOfBubbles,
                  sizeFactor: widget.sizeFactor,
                  opacity: widget.opacity,
                  paintingStyle: widget.paintingStyle,
                  strokeWidth: widget.strokeWidth,
                  shape: widget.shape,
                ),
              );
            },
          )
        : PlayAnimation(
            duration: checkToStopAnimation == 0
                ? Duration(seconds: widget.duration!)
                : Duration.zero,
            tween: ConstantTween(1),
            builder: (context, child, value) {
              _simulateBubbles();
              if (checkToStopAnimation == 0)
                return drawBubbles(
                  bubbles: BubbleModel(
                    bubbles: bubbles,
                    color: widget.colorOfBubbles,
                    sizeFactor: widget.sizeFactor,
                    opacity: widget.opacity,
                    paintingStyle: widget.paintingStyle,
                    strokeWidth: widget.strokeWidth,
                    shape: widget.shape,
                  ),
                );
              else
                return Container(); // will display a empty container after playing the animations.
            },
          );
  }

  /// This Function checks whether the bubbles in the screen have to be restarted due to
  /// frame skips.
  _simulateBubbles() {
    bubbles.forEach((bubbles) => bubbles.checkIfBubbleNeedsToBeRestarted());
  }
}
