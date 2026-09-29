import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double valor = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
        elevation: 0.0,
      ), // AppBar
      body: Column(
        children: [
          // Barra del slider: ocupa todo el ancho, pero el slider
          // se centra y no se estira de mas en pantallas grandes.
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.black54,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Slider(
                  value: valor,
                  min: 0,
                  max: 400,
                  label: valor.round().toString(),
                  divisions: 100,
                  onChanged: (value) {
                    setState(() {
                      valor = value;
                    });
                  },
                ), // Slider
              ), // ConstrainedBox
            ), // Center
          ), // Container
          // Zona de la imagen: ocupa TODO el espacio que sobre, sin
          // importar el tamano de la ventana (celular, tablet, navegador).
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black54,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // La imagen nunca puede ser mas grande que el espacio disponible.
                  final maximo = constraints.biggest.shortestSide;
                  final tamano = valor > maximo ? maximo : valor;
                  return Center(
                    child: Image(
                      image: AssetImage('assets/coco.png'),
                      height: tamano,
                      width: tamano,
                    ), // Image
                  ); // Center
                },
              ), // LayoutBuilder
            ), // Container
          ), // Expanded
        ], // <Widget>[]
      ), // Column
    ); // Scaffold
  }
}
