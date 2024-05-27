import 'package:flutter/material.dart';
import 'package:untitled8/appointment_page.dart';
import 'package:untitled8/chat_page.dart';
import 'package:untitled8/reports_page.dart';
import 'package:untitled8/delivery_status_page.dart';
import 'package:untitled8/initial_page.dart';

import 'ProductsPage.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String privilege;

  MyHomePage({required this.title, required this.privilege});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenido de la página principal...
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contenido del encabezado del Drawer...
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('REGISTRAR CITA'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('VER CHAT DE CONSULTAS'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
              },
            ),
            if (privilege == 'Administrador') ...[
              ListTile(
                leading: Icon(Icons.bar_chart),
                title: Text('REALIZAR INFORMES'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.business),
                title: Text('ESTADO DE LA ENTREGA'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryStatusPage()));
                },
              ),
            ],
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('SALIR'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InitialPage()),
                );
              },
            ),
            // Botones de categorías de productos
            ListTile(
              leading: Icon(Icons.desktop_windows),
              title: Text('PCs de Escritorio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(category: 'PCs de Escritorio')));
              },
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Laptops'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(category: 'Laptops')));
              },
            ),
            ListTile(
              leading: Icon(Icons.monitor),
              title: Text('Monitores'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(category: 'Monitores')));
              },
            ),
            ListTile(
              leading: Icon(Icons.keyboard),
              title: Text('Periféricos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage(category: 'Periféricos')));
              },
            ),
          ],
        ),
      ),
    );
  }
}


