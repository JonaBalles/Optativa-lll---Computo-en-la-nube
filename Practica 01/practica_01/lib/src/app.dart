import 'package:flutter/material.dart';
import 'package:practica_01/src/userData.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: DatosUsuarios(),
      ),
    );
  }
}