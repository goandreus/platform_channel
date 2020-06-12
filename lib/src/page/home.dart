import 'package:flutter/material.dart';
import 'package:platforml/src/native/native_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nativeText = NativeText();

  var _text = '';

  _getText() async {
    final text = await _nativeText.getText('Flutter -> dart');
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(_text)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getText,
        child: Icon(Icons.add),
      ),
    );
  }
}
