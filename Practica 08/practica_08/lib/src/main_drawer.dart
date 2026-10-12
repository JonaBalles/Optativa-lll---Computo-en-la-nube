import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                  backgroundColor: Colors.white,
                ), // CircleAvatar
                SizedBox(height: 5.0),
                Text('Jonatan Ballesteros', style: TextStyle(fontSize: 22.0)),
                SizedBox(height: 5.0),
                Text('Docente', style: TextStyle(fontSize: 16.0)),
                SizedBox(height: 20.0),
              ],
            ), // Column // Padding
          ),
        ), // Container
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ), // Icon
          title: Text('Perfil'),
        ), // ListTile
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.inbox,
            color: Colors.black,
          ), // Icon
          title: Text('Mensajeria'),
        ), // ListTile
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.assessment,
            color: Colors.black,
          ), // Icon
          title: Text('Dasboard'),
        ), // ListTile
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.settings,
            color: Colors.black,
          ), // Icon
          title: Text('Configuracion'),
        ), // ListTile
      ],
    ); // Column
  }
}
