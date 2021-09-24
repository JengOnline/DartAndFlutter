import 'package:flutter/material.dart';
import './text_controll.dart';
import './text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _mainText = 'Click button!!!';

  void _changeText() {
    setState(() {
      _mainText = 'Hello ^^';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
      ),
      body: Column(
        children: [text_controll(_changeText), text(_mainText)],
      ),
    ));
  }
}
