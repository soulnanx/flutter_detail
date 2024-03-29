import 'package:flutter/material.dart';
import 'package:flutter_detalhe/data/spend.dart';
import 'package:flutter_detalhe/ui/detail/item_card.dart';
import 'package:flutter_detalhe/ui/detail/item_card_statement.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdddddd),
        appBar: AppBar(
          title: Text('Detail'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            ItemCard(".... 1234", "TKK", "25/06/2019", "30,00"),
            ItemCardStatement(loadStatement()),
          ]),
        ));
  }

  List<Spend> loadStatement() {
    return [
      Spend(-25.0, "Terra", "Rua hipodromo"),
      Spend(-30.0, "Terra roxa", "Rua butantã"),
      Spend(-5.0, "Terra", "Rua hipodromo"),
      Spend(0.0, "Terra roxa", "Rua butantã"),
      Spend(-25.0, "Terra", "Rua hipodromo"),
      Spend(-30.0, "Terra roxa", "Rua butantã"),
      Spend(-5.0, "Terra", "Rua hipodromo"),
      Spend(0.0, "Terra roxa", "Rua butantã"),
    ];
  }
}