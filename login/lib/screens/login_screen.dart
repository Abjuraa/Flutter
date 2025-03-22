import 'package:flutter/material.dart';
import '../services/auth_services.dart';
import '../screens/singIn_screen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _MyLoginState();
}

class _MyLoginState extends State<login> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  final AuthServices _authServices = AuthServices();

  Future<void> _registrar() async {
    try {
      await _authServices.registrar(
        nombreController.text,
        apellidoController.text,
        correoController.text,
        contrasenaController.text,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Usuario registrado')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al registrar: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(15),
          width: 450,
          child: Column(
            children: [
              Text(
                "Formulario de Registro",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: apellidoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: correoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: contrasenaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black45),
                ),
                onPressed: _registrar,
                child: Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
