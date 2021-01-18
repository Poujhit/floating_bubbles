# Floating Bubbles

A Flutter Package for adding Floating bubbles in the Foreground to a widget.

## Getting Started
In your flutter project(in pubspec.yaml) add the dependency:
```yaml
dependencies:
   floating_bubbles: ^0.0.3
```

Import the package:

```dart
import 'package:floating_bubbles/floating_bubbles.dart';
```

## Usage
Here is an snippet on how to use Floating Bubbles to any Widget.
```
...dart

 Stack(
    children: [
     Positioned.fill(
        child: Container(
        color: Colors.red,
      ),
     ),
     Positioned.fill(
         child: FloatingBubbles(
         noOfBubbles: 25,
         colorOfBubbles: Colors.green.withAlpha(30),
         sizeFactor: 0.16,
    ),
 );
 ``` 
 ## Parameters:
 | Name | Description | Is It Required | Default Value |
 | :-----------------: | :---------------------------------------------: | :---: | :------: |
 | `noOfBubbles` | No. of Bubbles to be present in the screen at a given Time | **Yes** | `20` |
 | `colorOfBubbles` | Color of the bubbles | **Yes** | `Colors.white.withAlpha(30)` |
 | `sizeFactor` | Size Factor of each bubbles | **Yes** | `0.2` |
 
 ## Example
 The code for the Example shown below is [here](https://pub.dev/packages/floating_bubbles/example).

 <p align = "middle">
 <img src="https://raw.githubusercontent.com/Poujhit/floating_bubbles/master/screenshots/video.gif" width="320" height = "650">
 </p>
 

