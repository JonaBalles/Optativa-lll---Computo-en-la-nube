import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/resultado_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pesoCtrl = TextEditingController();
  final estaturaCtrl = TextEditingController();

  void _calcularIMC() {
    final peso = double.tryParse(pesoCtrl.text.replaceAll(',', '.'));
    final estatura = double.tryParse(estaturaCtrl.text.replaceAll(',', '.'));

    if (peso == null || estatura == null || estatura == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ingresa un peso y una estatura validos')),
      );
      return;
    }

    final imc = peso / (estatura * estatura);
    final data = Data(imc: imc, clasificacion: _clasificar(imc), imagen: _imagen(imc));

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ResultadoPage(data: data)),
    ); // MaterialPageRoute
  }

  String _clasificar(double imc) {
    if (imc < 18) {
      return 'Peso Bajo. Necesario valorar signos de desnutricion';
    } else if (imc <= 24.9) {
      return 'Normal';
    } else if (imc <= 26.9) {
      return 'Obesidad';
    } else if (imc <= 29.9) {
      return 'Obesidad grado I. Riesgo relativo para desarrollar\nenfermedades cardiovasculares.';
    } else if (imc <= 39.9) {
      return 'Obesidad grado II. Riesgo relativo muy alto para el\ndesarrollo de enfermedades cardiovasculares.';
    } else {
      return 'Obesidad grado III (Extrema o morbida). Riesgo relativo\nextremadamente alto para el desarrollo de enfermedades\ncardiovasculares.';
    }
  }

  String _imagen(double imc) {
    if (imc < 18) {
      return 'assets/images/bajo.png';
    } else if (imc <= 24.9) {
      return 'assets/images/normal.png';
    } else if (imc <= 26.9) {
      return 'assets/images/obesidad.png';
    } else if (imc <= 29.9) {
      return 'assets/images/grado1.png';
    } else if (imc <= 39.9) {
      return 'assets/images/grado2.png';
    } else {
      return 'assets/images/grado3.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('Mini Proyecto 01 - IMC'),
        centerTitle: true,
      ), // AppBar
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Calcula tu Indice de Masa Corporal',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextField(
                controller: pesoCtrl,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  hintText: 'Ej. 70',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight_outlined),
                ), // InputDecoration
              ), // TextField
              SizedBox(height: 20),
              TextField(
                controller: estaturaCtrl,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Estatura (m)',
                  hintText: 'Ej. 1.70',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ), // InputDecoration
              ), // TextField
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text('Calcular', style: TextStyle(fontSize: 16)),
                  onPressed: _calcularIMC,
                ), // ElevatedButton
              ),
            ], // <Widget>[]
          ), // Column
        ), // Center
      ), // Padding
    ); // Scaffold
  }
}

class Data {
  double imc;
  String clasificacion;
  String imagen;

  Data({required this.imc, required this.clasificacion, required this.imagen});
}
