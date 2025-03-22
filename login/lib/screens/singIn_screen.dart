import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import '../screens/index_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _MySignInState();
}

class _MySignInState extends State<SignIn> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  final AuthServices _authServices = AuthServices();

  Future<void> _iniciarSesion() async {
    try {
      await _authServices.iniciarSesion(
        correoController.text,
        contrasenaController.text,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Sesion iniciada')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Index()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al iniciar sesion: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicia Sesion')),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(15),
          width: 450,
          child: Column(
            children: [
              Text(
                'Formulario de Inicio de Sesion',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80),
              TextFormField(
                controller: correoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electronico',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: contrasenaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black45),
                ),
                onPressed: _iniciarSesion,
                child: Text(
                  'Iniciar Sesion',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
