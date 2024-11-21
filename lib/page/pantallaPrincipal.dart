import 'package:flutter/material.dart';
import '../logica/calcularVolumen.dart'; 

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final TextEditingController _radioController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _mensajeError = ''; 

  void _calcularVolumen() {
    double radio = double.tryParse(_radioController.text) ?? -1.0;
    double altura = double.tryParse(_alturaController.text) ?? -1.0;

    if (radio <= 0 || altura <= 0) {
      setState(() {
        _mensajeError = 'Error: Se deben ingresar números positivos'; 
      });
    } else {
      CalcularVolumen calcular = CalcularVolumen();
      setState(() {
        _mensajeError = ''; 
        double volumen = calcular.calcularVolumenCilindro(radio, altura);
        _mensajeError = 'Volumen: $volumen'; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lección: Calculadora de Volumen de Cilindro'),
        backgroundColor: Colors.cyan[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _radioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Radio:',
                filled: true,
                fillColor: Colors.cyan[100],
              ),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura:',
                filled: true,
                fillColor: Colors.cyan[100],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularVolumen,
              child: Text('Calcular Volumen'),
            ),
            SizedBox(height: 20),
            Text(
              _mensajeError, 
              style: TextStyle(
                fontSize: 24,
                color: _mensajeError.contains('Error') ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
