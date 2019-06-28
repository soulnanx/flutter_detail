import 'package:flutter/material.dart';
import 'package:flutter_detalhe/ui/detail/item_card.dart';
import 'item_card_statement_spend.dart';
import 'package:flutter_detalhe/data/spend.dart';

class ItemCardStatement extends StatelessWidget {
  List<Spend> _spendingList;

  List<ItemCardStatementSpend> loadCardSpending(){
    return _spendingList.map( (spend) =>
        ItemCardStatementSpend(spend.value, spend.placeName, spend.placeAddress)
    ).toList();
  }

  TextStyle style = TextStyle(color: Colors.black12, fontSize: 14);
  final List<Tab> myTabs = <Tab>[
    Tab(text: "7 DIAS"),
    Tab(text: "15 DIAS"),
    Tab(text: "30 DIAS")
  ];

  ItemCardStatement(this._spendingList);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
                "EXTRATO",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              )
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(labelColor: Colors.black54, tabs: myTabs),
                ),
                Container(
                  height: 250,
                  child: Container(
                    child: TabBarView(children: [
                      Container(
                        child:
                        ItemCard(".... 1234", "TKK", "25/06/2019", "30,00"),
                      ),
                      SingleChildScrollView(
                        child:  Column(
                          children: loadCardSpending(),
                        ),
                      ),
                      Container(
                        child: Text("User Body"),
                      ),
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
}
}