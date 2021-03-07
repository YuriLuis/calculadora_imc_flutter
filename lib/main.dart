import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Imc!"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {})],
      ),
    );
  }
}
