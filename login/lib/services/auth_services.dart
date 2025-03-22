import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  final String dataBaseUrl =
      kIsWeb
          ? 'http://localhost:4400/api/personas/usuarios' 
          : (Platform.isAndroid
              ? 'http://192.168.1.123:4400/api/personas/usuarios'
              : 'http://localhost:4400/api/personas/usuarios');

  Future<void> registrar(
    String nombre,
    String apellido,
    String correo,
    String contrasena,
  ) async {
    final url = Uri.parse('$dataBaseUrl/registrar');

    final loginResponse = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': nombre,
        'apellido': apellido,
        'email': correo,
        'password': contrasena,
      }),
    );

    if (loginResponse.statusCode == 200 || loginResponse.statusCode == 201) {
      final data = jsonEncode(loginResponse.body);
      print(data);
    } else {
      print('Error al registrar: ${loginResponse.body}');
      throw Exception('Error en el registro');
    }
  }

  Future<void> iniciarSesion(String correo, String contrasena) async {
    final url = Uri.parse('$dataBaseUrl/ingresar');

    final loginResponse = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': correo, 'password': contrasena}),
    );

    if (loginResponse.statusCode == 200 || loginResponse.statusCode == 201) {
      final data = jsonEncode(loginResponse.body);
      print(data);
    } else {
      print('Error al iniciar sesion: ${loginResponse.body}');
      throw Exception('Error al inciar sesion');
    }
  }
}
