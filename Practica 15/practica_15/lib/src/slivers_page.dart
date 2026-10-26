import 'package:flutter/material.dart';
import 'dart:math';

class SliversPage extends StatelessWidget {
  final rnd = new Random();

  final List<Color> colores = [
    Colors.black,
    Colors.white,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.grey,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.lime
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(70, (index) {
      final color = colores[rnd.nextInt(this.colores.length)];
      final esClaro = color.computeLuminance() > 0.5;

      return Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ), // BoxDecoration
        alignment: Alignment.center,
        child: Text(
          '$index',
          style: TextStyle(
            color: esClaro ? Colors.black54 : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ), // Text
      ); // Container
    }); // List.generate

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            floating: true,
            pinned: true,
            stretch: true,
            expandedHeight: 250,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: 16),
              title: Text(
                'Practica 15 - Slivers',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black)],
                ),
              ), // Text
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1445905595283-21f8ae8a33d2?fm=jpg&q=80&w=1200&auto=format&fit=crop',
                    fit: BoxFit.cover,
                  ), // Image.network
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black38, Colors.black87],
                      ), // LinearGradient
                    ), // BoxDecoration
                  ), // DecoratedBox
                ],
              ), // Stack
            ), // FlexibleSpaceBar
          ), // SliverAppBar
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(items),
            ), // SliverList
          ), // SliverPadding
        ],
      ), // CustomScrollView
    ); // Scaffold
  }
}