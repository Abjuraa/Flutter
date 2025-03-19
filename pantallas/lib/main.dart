import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: body(),
    );
  }
}

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 1'),
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hola Mundo', style: TextStyle(fontSize: 30)),
            Text('Bienvenidos a Flutter', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla2()),
                );
              },
              child: Text('Ir a la pantalla 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla3()),
                );
              },
              child: Text('Ir a la pantalla 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla 2'), leading: null),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: 250,
          width: 500,
          child: Column(
            children: [
              Text('Calculadora', style: TextStyle(fontSize: 30)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Primer Numero',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Segundo Numero',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pantalla3()),
                  );
                },
                child: Text('Ir a la pantalla 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 3'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hola Pantalla 3', style: TextStyle(fontSize: 30)),
            Text('Bienvenidos a la pantalla 3', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => body()),
                );
              },
              child: Text('Ir a la pantalla 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla2()),
                );
              },
              child: Text('Ir a la pantalla 2'),
            ),
          ],
        ),
      ),
    );
  }
}
