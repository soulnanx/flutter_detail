import 'package:flutter/material.dart';

class ItemCardStatement extends StatefulWidget {
  @override
  _ItemCardStatementState createState() => _ItemCardStatementState();
}

class _ItemCardStatementState extends State<ItemCardStatement>
    with SingleTickerProviderStateMixin{
  TextStyle style = TextStyle(color: Colors.black12, fontSize: 14);
  final List<Tab> myTabs = <Tab>[
    Tab(text: "7 DIAS"),
    Tab(text: "15 DIAS"),
    Tab(text: "30 DIAS")
  ];


  @override
  void initState() {
    super.initState();//    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "EXTRATO",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              )
            ],
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      labelColor: Colors.black54,
                      tabs: [
                    Tab(text: "Homffe"),
                    Tab(text: "Articles"),
                    Tab(text: "User"),
                  ]),
                ),
                Container(
                  height: 400,
                  child: Container(
                    child: TabBarView(children: [
                      Container(
                        child: Text("Home Bodhhy"),
                      ),
                      Container(
                        child: Text("Articles Body"),
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
