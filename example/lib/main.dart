import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

import 'fps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: true,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

// Simple example.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    eachFrame()
        .take(10000)
        .transform(const ComputeFps())
        // ignore: avoid_print
        .listen((fps) => print('fps: $fps'));
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 10,
            colorsOfBubbles: const [
              Colors.white,
              Colors.red,
            ],
            sizeFactor: 0.2,
            opacity: 70,
            paintingStyle: PaintingStyle.fill,
            shape: BubbleShape.circle, //This is the default
          ),
        ),
      ],
    );
  }
}
