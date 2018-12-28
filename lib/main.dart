import 'package:flutter/material.dart';
import './ui/page/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: Home(),
    );
  }
}