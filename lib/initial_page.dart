import 'package:flutter/material.dart';
import 'package:untitled8/my_home_page.dart';
import 'package:untitled8/rounded_button.dart';
import 'package:untitled8/main.dart'; // Importamos MyApp para el header

class InitialPage extends StatelessWidget {
  static const welcomeTitle = 'INICIO';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _privilege;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(welcomeTitle),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'SMART SERVICE SYSTEM',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0,
                children: [
                  RoundedButton(
                    onPressed: () {
                      showLoginDialog(context);
                    },
                    text: 'Iniciar Sesión',
                    color: Colors.deepPurpleAccent,
                    icon: Icons.login,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                  RoundedButton(
                    onPressed: () {
                      // Implementar la lógica para crear una cuenta
                    },
                    text: 'Crear Cuenta',
                    color: Colors.deepPurpleAccent,
                    icon: Icons.create,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('LOGIN'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Clave',
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Privilegio',
                  prefixIcon: Icon(Icons.security),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                value: _privilege,
                onChanged: (String? newValue) {
                  _privilege = newValue;
                },
                items: <String>['Administrador', 'Empleado'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _privilege != null) {
                  if ((_usernameController.text == 'luis' && _passwordController.text == '111' && _privilege == 'Administrador') ||
                      (_usernameController.text == 'juan' && _passwordController.text == '222' && _privilege == 'Empleado')) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: MyApp.header, privilege: _privilege!)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Usuario, clave o privilegio incorrectos'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Por favor complete todos los campos'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Ingresar'),
            ),
          ],
        );
      },
    );
  }
}


