import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void answerQuestion() {
    setState(() {
      if (_questionIndex < 1) {
        _questionIndex = _questionIndex + 1;
      }
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First App'),
          ),
          body: Column(
            children: [
              Question(questions[_questionIndex]),
              RaisedButton(
                child: const Text('Answer 1'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: const Text('Answer 2'),
                onPressed: () => {print('Answer 2 chosen!')},
              ),
              RaisedButton(
                child: const Text('Answer 3'),
                onPressed: () => {print('Answer 3 chosen!')},
              )
            ],
          )),
    );
  }
}
