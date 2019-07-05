import 'package:flutter/material.dart';
import 'package:flutter_detalhe/ui/detail/detail_screen.dart';
import 'package:flutter_detalhe/ui/converter/converter.dart';
import 'package:flutter_detalhe/ui/tasks/tasks_screen.dart';
import 'package:flutter_detalhe/ui/gifs/gifsAndGrid.dart';

import 'package:flutter_detalhe/ui/repo/repos.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Detail"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen()));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Converter"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  Converter()
                ));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Repo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ReposPage()
                ));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Tasks"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    TasksScreen()
                ));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Gifs & Grid"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    GifsAndGridScreen()
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
