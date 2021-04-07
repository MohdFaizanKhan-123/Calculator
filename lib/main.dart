import 'package:flutter/material.dart';
import 'simpleCalculate.dart';

main() {
  runApp(calculator());
}

class calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: simpleCalculate(),
    );
  }
}
