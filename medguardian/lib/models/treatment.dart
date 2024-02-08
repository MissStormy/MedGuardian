import 'package:medguardian/models/database.dart';

//Data from the treatment table
class Treatment {
  int? id;
  late String pirulaName;
  late DateTime startDate;
  late DateTime endDate;
  late int frecuency;
  DateTime? lastDose;
//Values
  Treatment() {
    pirulaName = '';
    startDate = DateTime.now();
    endDate = DateTime.now();
    frecuency = 0;
  }
//Builder without Id
  Treatment.witoutId(
      this.pirulaName, this.startDate, this.endDate, this.frecuency);
//Builder with Id
  Treatment.withId(
      this.id, this.pirulaName, this.startDate, this.endDate, this.frecuency);
//Map to control the data
  Treatment.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    pirulaName = (map['pirulaName'] != Null ? map['pirulaName'] : '');
    startDate = (map['startDate'] != Null)
        ? DateTime.parse(map['startDate'])
        : DateTime.now();
    endDate = (map['endDate'] != Null)
        ? DateTime.parse(map['endDate'])
        : DateTime.now();
    frecuency = (map['frecuency'] != Null ? map['frecuency'] : '');
  }
//TODO
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['pirulaName'] = pirulaName;
    map['startDate'] = startDate.toIso8601String();
    map['endDate'] = endDate.toIso8601String();
    map['frecuency'] = frecuency;
    return map;
  }

//To get the treatments back
  Future<List<Treatment>> getTreatments() async {
    List<Treatment> treatments = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> tretmentsDB =
        await dbHelper.dbQuery('treatments');
    for (int i = 0; i < tretmentsDB.length; i++) {
      treatments.add(Treatment.fromMap(tretmentsDB[i]));
    }
    return treatments;
  }

  saveTreatment(Treatment treatment) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('treatments', treatment.toMap());
  }

  DateTime nextDose() {
    return lastDose??startDate.add(Duration(hours: frecuency));
  }
  
  pirulaTaken (){
    lastDose = DateTime.now();
  }
}
