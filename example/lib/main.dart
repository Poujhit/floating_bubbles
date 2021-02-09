import 'package:example/fps.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: true,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

// This example given below is for stress test of the package.
// Here I have used a heavy rive animation along with floating_bubbles animation.

//To see a easy example on how to use this package. Scroll down to see the comments.
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Artboard _riveArtboard;
  final GlobalKey<FormState> _formKey = GlobalKey();
  // ignore: unused_field
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/knight063.riv').then(
      (data) async {
        final file = RiveFile();

        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('idle'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    eachFrame().take(10000).transform(const ComputeFps()).listen((fps) => print('fps: $fps'));
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _riveArtboard == null
                ? Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Rive(
                    artboard: _riveArtboard,
                    fit: BoxFit.cover,
                    useIntrinsicSize: true,
                  ),
          ),
          Positioned.fill(
            child: FloatingBubbles.alwaysRepeating(
              noOfBubbles: 40,
              colorOfBubbles: Colors.redAccent,
              sizeFactor: 0.2,
              opacity: 200,
              strokeWidth: 10,
              paintingStyle: PaintingStyle.stroke,
            ),
          ),
          Positioned(
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 8.0,
                margin: EdgeInsets.only(top: 200),
                child: Container(
                  height: 260,
                  constraints: BoxConstraints(minHeight: 260),
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'E-Mail'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text('LOGIN'),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                            color: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).primaryTextTheme.button.color,
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            child: Text('LOGIN'),
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Container(
//             color: Colors.blue,
//           ),
//         ),
//         Positioned.fill(
//           child: FloatingBubbles.alwaysRepeating(
//             noOfBubbles: 40,
//             colorOfBubbles: Colors.white,
//             sizeFactor: 0.2,
//             opacity: 70,
//             paintingStyle: PaintingStyle.fill,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class HomePage1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Container(
//             color: Colors.blue,
//           ),
//         ),
//         Positioned.fill(
//           child: FloatingBubbles(
//             noOfBubbles: 40,
//             colorOfBubbles: Colors.white,
//             sizeFactor: 0.2,
//             duration: 120, //120 seconds
//             opacity: 70,
//             paintingStyle: PaintingStyle.stroke,
//             strokeWidth: 8,
//           ),
//         ),
//       ],
//     );
//   }
// }
