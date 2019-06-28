import 'package:flutter/material.dart';

class ItemCardStatementSpend extends StatelessWidget {

  double _value;
  String _placeName;
  String _placeAddress;

  ItemCardStatementSpend(this._value, this._placeName, this._placeAddress);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8 , 0, 8, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Colors.redAccent,
                  ),
                Container(
                    height: 40.0,
                    width: 1.0,
                    margin:
                    const EdgeInsets.only(left: 6, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.black12,)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _placeName,
                          style: TextStyle(fontSize: 16, color: Colors.black26),
                        ),
                        Text(
                          _placeAddress,
                          style: TextStyle(fontSize: 10, color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _value.toString(),
                    style: TextStyle(fontSize: 18, color: _value < 0 ? Colors.red : Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
