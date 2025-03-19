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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculadora()),
                );
              },
              child: Text('Ir a la calculadora'),
            ),
            SizedBox(height: 5),
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

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _MyCalculadora();
}

class _MyCalculadora extends State<Calculadora> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();

  String _resultado = '';

  void _calcular(String operador) {
    double num1 = double.tryParse(_num1.text) ?? 0;
    double num2 = double.tryParse(_num2.text) ?? 0;
    double res = 0;

    switch (operador) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num1 / num2;
        break;
    }

    setState(() {
      _resultado = 'Resultado: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora 📱'), leading: null),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          height: 500,
          width: 500,
          child: Column(
            children: [
              Text('Calculadora', style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              TextField(
                controller: _num1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Primer Numero',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _num2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Segundo Numero',
                ),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _calcular('+'),
                    child: Text('+'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _calcular('-'),
                    child: Text('-'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _calcular('*'),
                    child: Text('*'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _calcular('/'),
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => body()),
                  );
                },
                child: Text('Ir a la pantalla 1'),
              ),
              SizedBox(height: 5),
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
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculadora()),
                );
              },
              child: Text('Ir a la calculadora'),
            ),
          ],
        ),
      ),
    );
  }
}
