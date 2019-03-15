import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ARDrawPape extends StatefulWidget {
  @override
  _ARDrawPapeState createState() => _ARDrawPapeState();
}

class _ARDrawPapeState extends State<ARDrawPape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Draw Demo"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: UiKitView(viewType: 'ARViewController'),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: RaisedButton(
                child: const Text('Draw'),
                onPressed: () {
                  canDraw();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void canDraw() async {
    final MethodChannel channel = MethodChannel('plugins.flutter.io/arkit');
    await channel.invokeMethod('arkit#draw');
  }
}
