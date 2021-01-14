import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          child: Bubbles(
            noOfBubbles: 40,
            colorOfBubbles: Colors.white.withAlpha(70),
            sizeFactor: 0.2,
          ),
        ),
      ],
    );
  }
}
