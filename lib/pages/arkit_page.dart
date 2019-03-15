import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ARKitPage extends StatefulWidget {
  @override
  _ARKitPageState createState() => _ARKitPageState();
}

class _ARKitPageState extends State<ARKitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Kit Demo"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: UiKitView(viewType: 'ARViewController'),
          ),
          Align(
            alignment: FractionalOffset.topCenter,
            child: RaisedButton(
              child: const Text('Debug'),
              onPressed: () {
                showDebug();
              },
            ),
          ),
          Align(
            alignment: FractionalOffset.topLeft,
            child: RaisedButton(
              child: const Text('Statistics'),
              onPressed: () {
                showStatistics();
              },
            ),
          ),
        ],
      ),
    );
  }

  void showDebug() async {
    final MethodChannel channel = MethodChannel('plugins.flutter.io/arkit');
    await channel.invokeMethod('arkit#debug');
  }

  void showStatistics() async {
    final MethodChannel channel = MethodChannel('plugins.flutter.io/arkit');
    await channel.invokeMethod('arkit#statistics');
  }
}
