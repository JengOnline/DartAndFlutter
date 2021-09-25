import 'package:flutter/material.dart';

// ignore: camel_case_types
class text extends StatelessWidget {
  final String displayText;
  const text(this.displayText, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Text(displayText),
    );
  }
}
