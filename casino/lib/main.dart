import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casino',
      home: casinoBody(),
    );
  }
}

class casinoBody extends StatefulWidget {
  const casinoBody({super.key});

  @override
  State<casinoBody> createState() => _casinoBodyState();
}

class _casinoBodyState extends State<casinoBody> {
  final List<String> _images = [
    'images/caritaFeliz.jpg',
    'images/caritaTriste.jpg',
    'images/caritaSeria.jpg',
  ];

  int index1 = 0;
  int index2 = 0;
  int index3 = 0;
  String mensaje = "";
  bool _isSpinning = false;

  final Random _random = Random();

  void _jugar() {
    if (_isSpinning) return;
    _isSpinning = true;

    int spins = 0;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        index1 = _random.nextInt(_images.length);
        index2 = _random.nextInt(_images.length);
        index3 = _random.nextInt(_images.length);
      });
      spins++;

      if (spins >= 10) {
        timer.cancel();
        _isSpinning = false;
      }

      if (index1 == index2 && index2 == index3) {
        mensaje = "🎉 ¡Ganaste!";
      } else {
        mensaje = "😢 Perdiste. Inténtalo de nuevo.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: const Text(
          '🎰 Casino de caritas 🎰',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(width: 200, height: 200, _images[index1]),
                ),
              ),
              Card(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(width: 200, height: 200, _images[index2]),
                ),
              ),
              Card(
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(width: 200, height: 200, _images[index3]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  mensaje,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ElevatedButton(
                  onPressed: () {
                    _jugar();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text(
                    'Jugar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
