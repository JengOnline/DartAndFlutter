import 'package:flutter/material.dart';

class text_controll extends StatelessWidget {
  VoidCallback _changeText;
  text_controll(this._changeText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: _changeText,
        style: ElevatedButton.styleFrom(
            primary: Colors.blue, onPrimary: Colors.white),
        child: Text('Button'),
      ),
    );
  }
}
