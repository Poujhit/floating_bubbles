import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 40,
            colorOfBubbles: Colors.white,
            sizeFactor: 0.2,
            opacity: 70,
            paintingStyle: PaintingStyle.fill,
          ),
        ),
      ],
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.blue,
          ),
        ),
        Positioned.fill(
          child: FloatingBubbles(
            noOfBubbles: 40,
            colorOfBubbles: Colors.white,
            sizeFactor: 0.2,
            duration: 120, //120 seconds
            opacity: 70,
            paintingStyle: PaintingStyle.stroke,
            strokeWidth: 8,
          ),
        ),
      ],
    );
  }
}
