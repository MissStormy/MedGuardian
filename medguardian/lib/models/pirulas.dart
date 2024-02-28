import 'package:medguardian/models/database.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//Data from the table
class Pirula {
  int? id;
  late String name;
  late String brand;
  late String dose;
  late String type;
  late int amountPerBox;
  late bool withFood;
  late bool withoutFood;
  late bool withOtherPirula;
  late int currentQuantity;
//Empty Builder
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
    if (map['withFood'] == 0) {
      withFood = false;
    } else {
      withFood = true;
    }
    if (map['withoutFood'] == 0) {
      withoutFood = false;
    } else {
      withoutFood = true;
    }
    if (map['withOtherPirula'] == 0) {
      withOtherPirula = false;
    } else {
      withOtherPirula = true;
    }
    // withFood = (map['withFood'] != null) ? map['withFood'] : 0;
    // withoutFood = (map['withoutFood'] != null) ? map['withoutFood'] : 0;
    // withOtherPirula =
    //     (map['withOtherPirula'] != null) ? map['withOtherPirula'] : 0;
    currentQuantity =
        (map['currentQuantity'] != null) ? map['currentQuantity'] : 0;
  }
//TODO
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['brand'] = brand;
    map['dose'] = dose;
    map['type'] = type;
    map['amountPerBox'] = amountPerBox;
    if (withFood) {
      map['withFood'] = 1;
    } else {
      map['withFood'] = 0;
    }
    if (withoutFood) {
      map['withoutFood'] = 1;
    } else {
      map['withoutFood'] = 0;
    }
    if (withOtherPirula) {
      map['withOtherPirula'] = 1;
    } else {
      map['withOtherPirula'] = 0;
    }
    map['currentQuantity'] = currentQuantity;
    return map;
  }

//To get the pirulas list
  Future<List<Pirula>> getPirulas() async {
    List<Pirula> pirulas = [];
    pirulas = await getFromApi();
    // DBHelper dbHelper = DBHelper();
    // List<Map<String, dynamic>> pirulasDB = await dbHelper.dbQuery('pirulas');
    // for (int i = 0; i < pirulasDB.length; i++) {
    //   pirulas.add(Pirula.fromMap(pirulasDB[i]));
    // }
    return pirulas;
  }

  Future<List<Pirula>> getFromApi() async {
    final response =
        await http.get(Uri.parse('http://10.196.61.105:5000/api/pirula'));
    if (response.statusCode == 200) {
      List<Pirula> lista = [];
      Pirula pirula = new Pirula();
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        print(data[i]);
        pirula = Pirula.fromMap(data[i]);
        lista.add(pirula);
      }
      return lista;
    } else {
      throw Exception('Error al leer datos de la API');
    }
  }

  savePirula(Pirula pirula) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('pirulas', pirula.toMap());
  }
}
