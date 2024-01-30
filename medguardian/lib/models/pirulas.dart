import 'package:medguardian/models/database.dart';

class Pirula {
  late int id;
  late String name;
  late String brand;
  late String dose;
  late String type;
  late int amountPerBox;
  late bool withFood;
  late bool withoutFood;
  late bool withOtherPirula;
  late int currentQuantity;

  Pirula() {
    name = '';
    brand = '';
    dose = '';
    type = '';
    amountPerBox = 0;
    withFood = false;
    withoutFood = false;
    withOtherPirula = false;
    currentQuantity = 0;
  }

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

  Pirula.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    name = (map['name'] != null) ? map['name'] : '';
    brand = (map['brand'] != null) ? map['brand'] : '';
    dose = (map['dose'] != null) ? map['dose'] : '';
    type = (map['type'] != null) ? map['type'] : '';
    amountPerBox = (map['amountPerBox'] != null) ? map['amountPerBox'] : 0;
    withFood = (map['withFood'] != null) ? map['withFood'] : true;
    withoutFood = (map['withoutFood'] != null) ? map['withoutFood'] : true;
    withOtherPirula =
        (map['withOtherPirula'] != null) ? map['withOtherPirula'] : true;
    currentQuantity =
        (map['currentQuantity'] != null) ? map['currentQuantity'] : 0;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
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
