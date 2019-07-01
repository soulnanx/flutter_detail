import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance";

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text){
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text){
    double dolar = double.parse(text);
    realController.text = (dolar*this.dolar).toStringAsFixed(2);
    euroController.text = (dolar*this.dolar / this.euro).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro*this.euro).toStringAsFixed(2);
    euroController.text = (euro*this.euro / this.euro).toStringAsFixed(2);
  }

  Future<Map> getValues() async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getValues(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                if (snapshot.hasError)
                  return Center(child: Text("Erro"));
                else
                  dolar = snapshot.data["results"]["currencies"]["USD"]
                          ["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]
                        ["buy"];
                return SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on,
                          size: 150, color: Colors.amber),
                      buildTextField("Reais", "R\$", realController, _realChanged),
                      Divider(),
                      buildTextField("Dolares", "U\$", dolarController, _dolarChanged),
                      Divider(),
                      buildTextField("Euros", "E", euroController, _euroChanged),
                    ],
                  ),
                ));
            }
          }),
    );
  }
}

Widget buildTextField(String label,
    String prefix,
    TextEditingController controller,
    Function func){

  return TextField(
    controller: controller,
    onChanged: func,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.amber,
        ),
        border: OutlineInputBorder(),
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
  );
}
