import 'package:medguardian/models/database.dart';
import 'package:path/path.dart';

//Data from the treatment table
class Treatment {
  int? id;
  late String pirulaName; // The name of the pirula to be taken
  late DateTime startDate; //When the treatment starts
  late DateTime endDate; // When the treatment ends
  late int frecuency; //Every how many hours does the pirula need to be taken
  late DateTime firstDose; // At what time to have the first pirula of the day
  late DateTime lastDose; // Last dose taken
//Empty Builder
  Treatment() {
    pirulaName = '';
    startDate = DateTime.now();
    endDate = DateTime.now();
    frecuency = 0;
    firstDose = DateTime.now();
    lastDose = DateTime.now();
  }
//Builder without Id
  Treatment.witoutId(this.pirulaName, this.startDate, this.endDate,
      this.frecuency, this.firstDose, this.lastDose);
//Builder with Id
  Treatment.withId(this.id, this.pirulaName, this.startDate, this.endDate,
      this.frecuency, this.firstDose, this.lastDose);
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
    firstDose = (map['firstDose'] != Null)
        ? DateTime.parse(map['firstDose'])
        : DateTime.now();
    lastDose = (map['lastDose'] != Null)
        ? DateTime.parse(map['lastDose'])
        : DateTime.now();
  }
//Convert to map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['pirulaName'] = pirulaName;
    map['startDate'] = startDate.toIso8601String();
    map['endDate'] = endDate.toIso8601String();
    map['frecuency'] = frecuency;
    map['firstDose'] = firstDose.toIso8601String();
    map['lastDose'] = firstDose.toIso8601String();
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

//To get the treatments betwen two hours back
  Future<List<Treatment>> getTreatmentsBetwenTime(
      DateTime initialTime, DateTime finalTime) async {
    List<Treatment> treatments = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> tretmentsDB =
        await dbHelper.dbQuery('treatments');
    for (int i = 0; i < tretmentsDB.length; i++) {
      if (Treatment.fromMap(tretmentsDB[i]).nextDose().isAfter(initialTime) &&
          Treatment.fromMap(tretmentsDB[i]).nextDose().isBefore(finalTime)) {
        treatments.add(Treatment.fromMap(tretmentsDB[i]));
      }
    }
    return treatments;
  }

//To save treatments
  saveTreatment(Treatment treatment) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('treatments', treatment.toMap());
  }

//Gives back the time for the next dose of this treatment
  DateTime nextDose() {
    if (lastDose.isAfter(_firstDoseToday().add(Duration(hours: -frecuency)))) {
      return _firstDoseToday();
    }
    return lastDose.add(Duration(hours: frecuency));
  }

//To mark when you take a Pirula
  pirulaTaken() {
    lastDose = DateTime.now();
  }

  DateTime _firstDoseToday() {
    return DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, firstDose.hour, firstDose.minute);
  }
}
