class medicine {
  int? _id;
  late String _name;
  late String _description;
  late String _medicineImage;
  late String _boxImage;
  late DateTime _expirationDate;
  late int _amountPerBox;
  late int _frecuency;
  late int _currentQuantity;
  late int _minimumQuantity;
  late int _dose;
  late bool _active;
  //constructor
  medicine() {
    this._name = '';
    this._description = '';
    this._medicineImage = '';
    this._boxImage = '';
    this._expirationDate = DateTime.now();
    this._amountPerBox = 0;
    this._frecuency = 0;
    this._currentQuantity = 0;
    this._minimumQuantity = 0;
    this._dose = 0;
    this._active = false;
  }
  //builder wothout id
  medicine.withoutId(this._name, this._description, this._medicineImage, this._boxImage, this._expirationDate, this._amountPerBox, this._frecuency, this._currentQuantity, this._minimumQuantity, this._active);
  //builder with id
  medicine.withId(this._id, this._name, this._description, this._medicineImage, this._boxImage, this._expirationDate, this._amountPerBox, this._frecuency, this._currentQuantity, this._minimumQuantity, this._active);
  //builder with map
  medicine.fromMap(Map<String, dynamic> map) {
    this._id = (map['id']!=null)?map['id']:null;
    this._name = (map['name']!=null)?map['name']:'';
    this._description = (map['description']!=null)?map['description']:'';
    this._medicineImage = (map['medicineImage']!=null)?map['medicineImage']:'';
    this._boxImage = (map['boxImage']!=null)?map['boxImage']:'';
    this._expirationDate = (map['expirationDate']!=null)?DateTime.parse(map['expirationDate']):DateTime.now();
    this._amountPerBox = (map['amountPerBox']!=null)?map['amountPerBox']:0;
    this._frecuency = (map['frecuency']!=null)?map['frecuency']:0;
    this._currentQuantity = (map['currentQuantity']!=null)?map['currentQuantity']:0;
    this._minimumQuantity = (map['minimumQuantity']!=null)?map['minimumQuantity']:0;
    this._dose = (map['dose']!=null)?map['dose']:0;
    this._active = (map['active']!=null)?map['active']:true;
  }

  //Getters & setters 
  int? get id => _id;
  String get name => _name;
  String get description => _description;
  String get medicineImage => _medicineImage;
  String get boxImage => _boxImage;
  DateTime get expirationDate => _expirationDate;
  int get amountPerBox => _amountPerBox;
  int get frecuency => _frecuency;
  int get currentCuantity => _currentQuantity;
  int get minimunmQuantity => _minimumQuantity;
  int get dose => _dose;
  bool get active => _active;

  set name(String nombre) {
    this._name = nombre;
  }

  set description(String description) {
    this._description = description;
  }

  set medicineImage(String medicineImage) {
    this._medicineImage = medicineImage;
  }

  set boxImage(String boxImage) {
    this._boxImage = boxImage;
  }

  set expirationDate(DateTime expirationDate) {
    this._expirationDate = expirationDate;
  } 

  set amountPerBox(int amountPerBox) {
    this._amountPerBox = amountPerBox;
  }

  set frecuency(int frecuency) {
    this._frecuency = frecuency;
  }

  set currentCuantity(int currentCuantity) {
    this._currentQuantity = currentCuantity;
  }

  set minimunmQuantity(int minimunmQuantity) {
    this._minimumQuantity = minimunmQuantity;
  }

  set dose(int dose) {
    this._dose = dose;
  }

  set active(bool active) {
    this._active = active;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['medicineImage'] = _medicineImage;
    map['boxImage'] = _boxImage;
    map['expirationDate'] = _expirationDate.toIso8601String();
    map['amountPerBox'] = _amountPerBox;
    map['frecuency'] = _frecuency;
    map['currentQuantity'] = _currentQuantity;
    map['minimumQuantity'] = _minimumQuantity;
    map['dose'] = _dose;
    map['active'] = _active;
    return map;
  }

}