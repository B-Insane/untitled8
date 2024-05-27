import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Cita'),
      ),
      body: Center(
        child: Text('Página para registrar citas.'),
      ),
    );
  }
}
