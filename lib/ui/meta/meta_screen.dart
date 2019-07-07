import 'package:flutter/material.dart';
import 'package:flutter_detalhe/data/category.dart';
import 'package:flutter_detalhe/data/ticket.dart';

List<Category> _categoryList = [
  Category("Arvore", Colors.green, Icons.delete),
  Category("Lixo", Colors.yellow, Icons.cloud),
  Category("Bueiro", Colors.red, Icons.check),
  Category("Iluminação", Colors.purple, Icons.date_range),
  Category("Acesso", Colors.black, Icons.accessible),
  Category("Alagamento", Colors.orange, Icons.create_new_folder),
  Category("Pixação", Colors.blue, Icons.face),
  Category("Sinalização", Colors.amber, Icons.home),
  Category("Dengue", Colors.brown, Icons.style),
];

List<Ticket> _ticketList = [
  Ticket(
      123,
      "Poda de arvore",
      "Arvore mto grante que está destruindo os fios de energia",
      _categoryList.elementAt(1)),
  Ticket(
      432,
      "Buraco na via",
      "Buraco no meio da avenida, varios carros ja cairam nele",
      _categoryList.elementAt(3)),
  Ticket(1223, "Iluminação", "Há mais de um mes estamos completamente sem luz",
      _categoryList.elementAt(7)),
  Ticket(
      123, "Poda de arvore", "Arvore mto grante", _categoryList.elementAt(1)),
  Ticket(432, "Buraco na via", "Arvore mto grante", _categoryList.elementAt(3)),
  Ticket(1223, "Iluminação", "Arvore mto grante", _categoryList.elementAt(7)),
  Ticket(
      123, "Poda de arvore", "Arvore mto grante", _categoryList.elementAt(1)),
  Ticket(432, "Buraco na via", "Arvore mto grante", _categoryList.elementAt(3)),
  Ticket(1223, "Iluminação", "Arvore mto grante", _categoryList.elementAt(7)),
  Ticket(
      123, "Poda de arvore", "Arvore mto grante", _categoryList.elementAt(1)),
  Ticket(432, "Buraco na via", "Arvore mto grante", _categoryList.elementAt(3)),
  Ticket(1223, "Iluminação", "Arvore mto grante", _categoryList.elementAt(7)),
];

class MetaScreen extends StatefulWidget {
  @override
  _MetaScreenState createState() => _MetaScreenState();
}

class _MetaScreenState extends State<MetaScreen> {
  double _elevationCard = 2;

  Widget _createButton(icon, label) {
    return GestureDetector(
      onTapDown: (s) {
        setState(() {
          _elevationCard = 5.0;
        });
      },
      onTapUp: (t) {
        setState(() {
          _elevationCard = 1.0;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: _elevationCard,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: icon,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createCardTicket(context, index) {
    double c_width = MediaQuery.of(context).size.width * 0.7;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              _ticketList.elementAt(index).category.getIcon(),
              Wrap(
                children: <Widget>[
                  Text(
                    _ticketList.elementAt(index).id.toString(),
                    style: TextStyle(fontSize: 8),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: c_width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _ticketList.elementAt(index).title,
                style: TextStyle(fontSize: 18),
              ),
              Text(_ticketList.elementAt(index).body),
            ],
          ),
        ),
      ])),
    );
  }

  Widget _customScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: 120.0,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: _buildHeader(),
          ),
        ),
        SliverFillRemaining(
            child: SafeArea(
          child: Column(
            children: <Widget>[
              Table(
                children: [
                  TableRow(children: [
                    _createButton(_categoryList.elementAt(0).getIcon(),
                        _categoryList.elementAt(0).title),
                    _createButton(_categoryList.elementAt(1).getIcon(),
                        _categoryList.elementAt(1).title),
                    _createButton(_categoryList.elementAt(2).getIcon(),
                        _categoryList.elementAt(2).title),
                  ]),
                  TableRow(children: [
                    _createButton(_categoryList.elementAt(3).getIcon(),
                        _categoryList.elementAt(4).title),
                    _createButton(_categoryList.elementAt(4).getIcon(),
                        _categoryList.elementAt(5).title),
                    _createButton(_categoryList.elementAt(5).getIcon(),
                        _categoryList.elementAt(6).title),
                  ]),
                  TableRow(children: [
                    _createButton(_categoryList.elementAt(6).getIcon(),
                        _categoryList.elementAt(6).title),
                    _createButton(_categoryList.elementAt(7).getIcon(),
                        _categoryList.elementAt(7).title),
                    _createButton(_categoryList.elementAt(8).getIcon(),
                        _categoryList.elementAt(8).title),
                  ]),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Minhas Solucitações (23)"),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: _createCardTicket,
                  itemCount: _ticketList.length,
                ),
              )
            ],
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _customScrollView());
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.blue,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
                child:  new Container(
                    width: 70.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: new Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/keanueOk.jpg")
                        )
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Keanue Reeves",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    "122",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Solicitaçoes cadastradas",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
