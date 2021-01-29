# Floating Bubbles [![Build Status](https://img.shields.io/github/workflow/status/Poujhit/floating_bubbles/Dry%20Run%20Publish%20plugin/master?style=for-the-badge)](https://github.com/Poujhit/floating_bubbles/actions)
[![pub version](https://img.shields.io/pub/v/floating_bubbles?color=blue&style=for-the-badge)](https://pub.dev/packages/floating_bubbles)

### A Flutter Package for adding Floating bubbles in the Foreground to a widget. 

## Getting Started
In your flutter project(in pubspec.yaml) add the dependency:
```yaml
dependencies:
   floating_bubbles: ^0.0.9
```

Import the package:

```dart
import 'package:floating_bubbles/floating_bubbles.dart';
```

## Usage
## Breaking Changes to the Api is made in v0.0.8, if you are using below v0.0.8, read before you upgrade.!!

Here is an snippet on how to use Floating Bubbles to any Widget.
### Creating FloatingBubbles() (this creates the animation and plays for amount of time you give as the duration.)
```dart
 return Stack(
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
         duration: 120,//120 seconds. 
    ),
 );
 ``` 

 ### Creating FloatingBubbles.alwaysRepeating() (Creates Floating Bubbles that always floats and doesn't stop.)
 ```dart
 return Stack(
    children: [
     Positioned.fill(
        child: Container(
        color: Colors.red,
      ),
     ),
     Positioned.fill(
         child: FloatingBubbles.alwaysRepeating(
         noOfBubbles: 25,
         colorOfBubbles: Colors.green.withAlpha(30),
         sizeFactor: 0.16,
    ),
 );
 ``` 

 ## Parameters:
 ### For Creating FloatingBubbles()
 | Name | Description | Is It Required | Default Value |
 | :-----------------: | :---------------------------------------------: | :---: | :------: |
 | `noOfBubbles` | No. of Bubbles to be present in the screen at a given Time | **Yes** | `-` |
 | `colorOfBubbles` | Color of the bubbles | **Yes** | `-` |
 | `sizeFactor` | Size Factor of each bubbles | **Yes** | `-` |
 | `duration` | Duration to play the animation (input is taken as seconds) | **Yes** | `-` |
 
 ### For Creating FloatingBubbles.alwaysRepeating()
  | Name | Description | Is It Required | Default Value |
  | :-----------------: | :---------------------------------------------: | :---: | :------: |
  | `noOfBubbles` | No. of Bubbles to be present in the screen at a given Time | **Yes** | `-` |
  | `colorOfBubbles` | Color of the bubbles | **Yes** | `-` |
  | `sizeFactor` | Size Factor of each bubbles | **Yes** | `-` |

 ## Example
 The code for the Example shown below is [here](https://pub.dev/packages/floating_bubbles/example).

 <p align = "middle">
 <img src="https://raw.githubusercontent.com/Poujhit/floating_bubbles/master/screenshots/video.gif" width="320" height = "650">
 </p>

 ## About Me
 - [My Other Works](https://github.com/Poujhit)

 ## Support
 Give a ⭐/👍 if you liked the work!! :)
 Suggestions are Welcome. Any issues just open an issue. I will reach you as soon as possible.

 ## License
 The Scripts and Documentation in this project are released under the [MIT License](https://github.com/Poujhit/floating_bubbles/blob/master/LICENSE) 
 

