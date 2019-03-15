import 'package:flutter/material.dart';

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
      body: Center(
        child: UiKitView(viewType: 'ARDrawView'),
      ),
    );
  }
}
