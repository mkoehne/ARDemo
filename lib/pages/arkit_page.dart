import 'package:flutter/material.dart';

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
      body: Center(
        child: UiKitView(viewType: 'ARView'),
      ),
    );
  }
}
