import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Tabs Page'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.accessibility_new)),
              Tab(icon: Icon(Icons.mail)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.access_alarm)),
            ],
          ), // TabBar
        ), // AppBar
        body: TabBarView(
          children: [
            // Cada pestaña se centra y se adapta a cualquier tamano de ventana
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ACCESIBILIDAD',
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                  Icon(Icons.accessibility_new, size: 120),
                ],
              ), // Column
            ), // Center
            Center(child: Icon(Icons.mail, size: 120)),
            Center(child: Icon(Icons.map, size: 120)),
            Center(child: Icon(Icons.access_alarm, size: 120)),
          ],
        ), // TabBarView
      ), // Scaffold
    ); // DefaultTabController
  }
}
