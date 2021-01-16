# Floating Bubbles

A Flutter Package for adding Floating bubbles in the Foreground to a widget.

## Getting Started
In your flutter project(in pubspec.yaml) add the dependency:
```
dependencies:
   floating_bubbles: ^0.0.2
```

Import the package:

```
import 'package:floating_bubbles/floating_bubbles.dart';
```

## Usage
Here is an snippet on how to use Floating Bubbles to any Widget.
```
 Stack(
    children: [
     Positioned.fill(
        child: Container(
        color: Colors.red,
      ),
     ),
     Positioned.fill(
         child: Bubbles(
         noOfBubbles: 20,
         colorOfBubbles: Colors.white.withAlpha(30),
         sizeFactor: 0.2,
    ),
 );
 ```

 ## Example
 The code for the Example shown below is [here](https://pub.dev/packages/floating_bubbles/example).

 <p align = "middle">
 <img src="./sceenshots/video.gif" width="320" height = "750">
 </p>
 

