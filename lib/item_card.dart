import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  String _cardNumber;
  String _alias;
  String _nextBenefit;
  String _averageSpending;


  ItemCard(this._cardNumber,
      this._alias,
      this._nextBenefit,
      this._averageSpending);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        height: 160.0,
                        width: 10.0,
                        margin:
                        const EdgeInsets.only(left: 0.0, right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0)))),
                    Expanded(

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                          Divider(),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "CARTÃO",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        _cardNumber,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "APELIDO",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        _alias,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "PROXIMO CRÉDITO",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        _nextBenefit,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "TICKET MÉDIO DIÁRIO",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        _averageSpending,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }

}