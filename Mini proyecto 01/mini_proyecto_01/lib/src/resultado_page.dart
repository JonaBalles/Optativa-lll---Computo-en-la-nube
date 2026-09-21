import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/home_page.dart';

class ResultadoPage extends StatelessWidget {
  final Data data;
  ResultadoPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Resultado'),
        centerTitle: true,
      ), // AppBar
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(data.imagen, width: 140, height: 140),
              SizedBox(height: 20),
              Text(
                'Tu IMC es: ${data.imc.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                data.clasificacion,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white,
                ),
                child: Text('Calcular de nuevo'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ), // ElevatedButton
            ], // <Widget>[]
          ), // Column
        ), // Center
      ), // Padding
    ); // Scaffold
  }
}
