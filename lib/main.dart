import 'package:flutter/material.dart';
import '../page/pantallaPrincipal.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculo de Volumen',
      home: PantallaPrincipal(),
    );
  }
}
