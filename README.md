# Floating Bubbles

A Flutter Package for adding Floating bubbles in the background to a widget.

## Usage

```
 Stack(
    children: [
     Positioned.fill(
        child: Container(
        color: Colors.blue,
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
 

