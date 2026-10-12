import 'package:flutter/material.dart';
import 'package:practica_07/src/bottom_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 07',
      home: BottomNavigatorPage(),
    ); // MaterialApp
  }
}
