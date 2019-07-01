import 'package:flutter/material.dart';
import 'package:flutter_detalhe/ui/detail/detail_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Detail"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen()));
              },
            ),
            RaisedButton(
              child: Text("Services"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}