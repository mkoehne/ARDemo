import 'package:ardemo/pages/ardraw_page.dart';
import 'package:ardemo/pages/arkit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'AR Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String _channel = 'test_activity';
  static const platform = const MethodChannel(_channel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('ARKit Demo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ARKitPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('AR Draw'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ARDrawPape()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('6D.ai'),
            onTap: () {
              _open6D();
            },
          ),
        ],
      ),
    );
  }

  _open6D() async {
    try {
      await platform.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
