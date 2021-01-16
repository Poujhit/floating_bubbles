/// ### Floating Bubbles Widget
///
/// With this Floating Bubbles Package, you can easily add bubbles which float from
/// bottom to top to any widget using a Stack.
///
/// For Example
///
/// ```
///   Stack(
///     children: [
///      Positioned.fill(
///         child: Container(
///         color: Colors.blue,
///       ),
///      ),
///      Positioned.fill(
///          child: FloatingBubbles(
///          noOfBubbles: 20,
///          colorOfBubbles: Colors.white.withAlpha(30),
///          sizeFactor: 0.2,
///     ),
///  );
/// ```
/// This was made with the help of Simple Animation package.
library floating_bubbles;

export 'src/bubbles.dart';
