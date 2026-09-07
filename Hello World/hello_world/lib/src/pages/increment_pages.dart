import 'package:flutter/material.dart';
import 'dart:math';

class IncrementPage extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() {
    return _IncrementPageState();
  }
}

class _IncrementPageState extends State<IncrementPage> {
  int _conteo = 0;
  bool _bump = false;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Mi primer APP en Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 210,
                    height: 210,
                    child: CircularProgressIndicator(
                      value: (_conteo % 50) / 50,
                      strokeWidth: 4,
                      backgroundColor: Colors.grey.shade300,
                      color: Colors.blueAccent
                    ),
                  ),
                  AnimatedScale(
                    scale: _bump ? 1.12 : 1.0,
                    duration: const Duration(milliseconds: 180),
                    child: Text('$_conteo', style: TextStyle(fontSize: 76, fontWeight: FontWeight.bold, fontFamily: 'monospace'
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Numeros de clicks', style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
        
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: _decrementar
            ),
            SizedBox(width: 16),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _incrementar
            )
          ],
        )
      );
    }

    void _incrementar() {
      setState(() {
        _conteo++;
        _bump = true;
      });

      Future.delayed(const Duration(milliseconds: 180), () {
        setState(() {
          _bump = false;
        });
      });
    }

    void _decrementar() {
      setState(() {
        _conteo--;
        if (_conteo < 0) {
          _conteo = 0;
          _bump = false;
          AlertDialog alert = AlertDialog(
            title: Text('Error'),
            content: Text('El contador no puede ser menor a 0'),
            actions: [
              ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Continuar'),
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (context) => alert,
          );
        }
        _bump = true;
      });

      Future.delayed(const Duration(milliseconds: 180), () {
        setState(() {
          _bump = true;
        });
      });
    }
}