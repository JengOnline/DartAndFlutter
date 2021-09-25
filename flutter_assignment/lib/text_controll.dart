import 'package:flutter/material.dart';

class TextControll extends StatelessWidget {
  final VoidCallback _changeText;
  const TextControll(this._changeText, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ElevatedButton(
        onPressed: _changeText,
        style: ElevatedButton.styleFrom(
            primary: Colors.blue, onPrimary: Colors.white),
        child: const Text('Button'),
      ),
    );
  }
}
