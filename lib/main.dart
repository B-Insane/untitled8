import 'package:flutter/material.dart';
import 'package:untitled8/appointment_page.dart';
import 'package:untitled8/chat_page.dart';
import 'package:untitled8/reports_page.dart';
import 'package:untitled8/delivery_status_page.dart';
import 'package:untitled8/initial_page.dart'; // Importamos InitialPage
import 'package:untitled8/rounded_button.dart'; // Importamos RoundedButton

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const header = 'SMART SERVICE SYSTEM.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: header,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.blueGrey[50], // Cambiado backgroundColor por scaffoldBackgroundColor
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      home: InitialPage(),
    );
  }
}


