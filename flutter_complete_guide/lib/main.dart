import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer chosen!');
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
              const Text('The question!'),
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
