
class Spend {
  double _value;
  String _placeName;
  String _placeAddress;

  Spend(this._value, this._placeName, this._placeAddress);

  double get value => _value;

  String get placeName => _placeName;

  String get placeAddress => _placeAddress;
}