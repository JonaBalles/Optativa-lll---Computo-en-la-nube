import 'package:flutter/material.dart';
import 'package:practica_08/src/main_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica 08',
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 08'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.orange,
      ), // AppBar
      body: Container(
        color: Colors.white30,
      ), // Container
      drawer: Drawer(
        child: MainDrawer(),
      ), // Drawer
    ); // Scaffold
  }
}
