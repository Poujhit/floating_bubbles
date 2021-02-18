/// ### Floating Bubbles Widget
///
/// With this Floating Bubbles Package, you can easily add bubbles which float from
/// bottom to top to any widget using a Stack.
///
/// For Example
///
/// ```
///   return Stack(
///       children: [
///         Positioned.fill(
///           child: Container(
///           color: Colors.blue,
///          ),
///        ),
///       Positioned.fill(
///           child: FloatingBubbles.alwaysRepeating(
///           noOfBubbles: 40,
///           colorOfBubbles: Colors.white,
///           sizeFactor: 0.2,
///           opacity: 70,
///           paintingStyle: PaintingStyle.fill,
///           shape: BubbleShape.circle, //This is the default
///          ),
///       ),
///     ],
///   );
/// ```
/// This was made with the help of Simple Animation package.
library floating_bubbles;

export 'src/bubbles.dart';
