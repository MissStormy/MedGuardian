import 'package:medguardian/models/database.dart';

//Data from the table
class Pirula {
  late int id;
  late String name;
  late String brand;
  late String dose;
  late String type;
  late int amountPerBox;
  late int withFood;
  late int withoutFood;
  late int withOtherPirula;
  late int currentQuantity;
//Initialize the values
  Pirula() {
    name = '';
    brand = '';
    dose = '';
    type = '';
    amountPerBox = 0;
    withFood = 0;
    withoutFood = 0;
    withOtherPirula = 0;
    currentQuantity = 0;
  }
//Builder without Id
  Pirula.withoutId(
      this.name,
      this.brand,
      this.dose,
      this.type,
      this.amountPerBox,
      this.withFood,
      this.withoutFood,
      this.withOtherPirula,
      this.currentQuantity);
//Builder with Id
  Pirula.withId(
      this.id,
      this.name,
      this.brand,
      this.dose,
      this.type,
      this.amountPerBox,
      this.withFood,
      this.withoutFood,
      this.withOtherPirula,
      this.currentQuantity);
//Receive the data and put it in a map
  Pirula.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    name = (map['name'] != null) ? map['name'] : '';
    brand = (map['brand'] != null) ? map['brand'] : '';
    dose = (map['dose'] != null) ? map['dose'] : '';
    type = (map['type'] != null) ? map['type'] : '';
    amountPerBox = (map['amountPerBox'] != null) ? map['amountPerBox'] : 0;
    withFood = (map['withFood'] != null) ? map['withFood'] : 0;
    withoutFood = (map['withoutFood'] != null) ? map['withoutFood'] : 0;
    withOtherPirula =
        (map['withOtherPirula'] != null) ? map['withOtherPirula'] : 0;
    currentQuantity =
        (map['currentQuantity'] != null) ? map['currentQuantity'] : 0;
  }
//TODO
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['brand'] = brand;
    map['dose'] = dose;
    map['type'] = type;
    map['amountPerBox'] = amountPerBox;
    map['withFood'] = withFood;
    map['withoutFood'] = withoutFood;
    map['withOtherPirula'] = withOtherPirula;
    map['currentQuantity'] = currentQuantity;
    return map;
  }

//To get the pirulas list
  Future<List<Pirula>> GetPirulas() async {
    List<Pirula> pirulas = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> pirulasDB = await dbHelper.dbQuery('pirulas');
    for (int i = 0; i < pirulasDB.length; i++) {
      pirulas.add(Pirula.fromMap(pirulasDB[i]));
    }
    return pirulas;
  }
}
