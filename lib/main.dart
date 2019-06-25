import 'package:flutter/material.dart';

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
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Center(
                    child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                height: 200.0,
                                width: 20.0,
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0)))),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        Icons.refresh,
                                        size: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "CARTÃO BLOQUEADO",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      height: 1.0,
                                      width: 280.0,
                                      color: Colors.black26,
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[

                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("CARTÃO", style: TextStyle(color: Colors.black38, fontSize: 12),),
                                              Text(".... 7534", style: TextStyle(color: Colors.black38, fontSize: 12),)
                                            ],
                                          ),),
                                      ),

                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("APELIDO", style: TextStyle(color: Colors.black38, fontSize: 12),),
                                              Text("TK", style: TextStyle(color: Colors.black38, fontSize: 12),)
                                            ],
                                          ),),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            )));
  }
}
