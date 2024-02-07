import 'package:flutter/material.dart';
import 'package:medguardian/models/database.dart';

//Data from the table
class Pirula {
  late int? id;
  late String name;
  late String brand;
  late String dose;
  late String type;
  late int amountPerBox;
  late bool withFood;
  late bool withoutFood;
  late bool withOtherPirula;
  late int currentQuantity;
//Initialize the values
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
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> pirulasDB = await dbHelper.dbQuery('pirulas');
    for (int i = 0; i < pirulasDB.length; i++) {
      pirulas.add(Pirula.fromMap(pirulasDB[i]));
    }
    return pirulas;
  }

  savePirula(Pirula pirula) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('pirulas', pirula.toMap());
  }
}
