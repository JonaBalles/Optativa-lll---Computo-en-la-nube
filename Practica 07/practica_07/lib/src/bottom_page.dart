import 'package:flutter/material.dart';

class BottomNavigatorPage extends StatefulWidget {
  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Text('Mapa', style: TextStyle(color: Colors.red, fontSize: 50)),
    ), // Center
    Center(
      child: Text('E-Mail',
          style: TextStyle(color: Colors.amber, fontSize: 50)), // Text // Center
    ),
    Center(
      child:
          Text('Alarma', style: TextStyle(color: Colors.blue, fontSize: 50)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 07'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ), // AppBar
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[200],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'E-mail',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarma',
          ), // BottomNavigationBarItem
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ), // BottomNavigationBar // Scaffold
    );
  }
}
