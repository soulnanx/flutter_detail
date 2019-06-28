import 'package:flutter/material.dart';
import 'item_card.dart';
import 'item_card_statement.dart';

void main() => runApp(MaterialApp(
      title: 'Detalhe',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Detail'),
          backgroundColor: Colors.green,
        ),
        body: ItemCardStatement(
//          child: Column(
//              children: <Widget>[
//              //ItemCard(".... 1234", "TKK", "25/06/2019", "30,00"),
//              ItemCardStatement()


          ),
        );
  }
}
