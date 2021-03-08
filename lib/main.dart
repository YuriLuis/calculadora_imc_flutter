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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _infoImc = "Informe seus dados!";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetaCamposTextos() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      _infoImc = "Informe seus dados!";
    });
  }

  void calculaImc() {
    if (_formKey.currentState.validate()) {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);
      verificaQualGrauImc(imc);
    }
  }

  void verificaQualGrauImc(double imc) {
    setState(() {
      if (imc < 18.6) {
        _infoImc = "Magro (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc <= 24.9) {
        _infoImc = "Peso Normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.9) {
        _infoImc = "Sobrepeso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.9) {
        _infoImc = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.9) {
        _infoImc = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        _infoImc = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      } else {
        _infoImc = "Informe Seus dados";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora Imc"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _resetaCamposTextos();
                })
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person_outlined, size: 120.0, color: Colors.green),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (KG)",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 25.0)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: pesoController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu peso!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (CM)",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 25.0)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: alturaController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua altura!";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          calculaImc();
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Text(
                    _infoImc,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  )
                ],
              ),
            )));
  }
}
