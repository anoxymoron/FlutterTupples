import 'package:flutter/material.dart';
import 'package:flutter_tuples/MainMenu.dart';

void main() {
  runApp(Tuples());
}

class Tuples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainMenu(),
    );
  }
}
