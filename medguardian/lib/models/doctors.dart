import 'package:medguardian/models/database.dart';

//id INTEGER PRIMARY KEY, medical_speciality TEXT,
//name TEXT, ocupation TEXT, age INTEGER, shift TEXT
//Data from the doctors table
class Doctor {
  int? id;
  late String medicalSpeciality;
  late String name;
  late String ocupation;
  late int age;
  late String shift;

//Empty Builder
  Doctor() {
    medicalSpeciality = '';
    name = '';
    ocupation = '';
    age = 0;
    shift = '';
  }

  //Builder without Id
  Doctor.withoutId(
      this.medicalSpeciality, this.name, this.ocupation, this.age, this.shift);
  //Builder with Id
  Doctor.withId(this.id, this.medicalSpeciality, this.name, this.ocupation,
      this.age, this.shift);
//Builder from map
  Doctor.fromMap(Map<String, dynamic> map) {
    id = (map['id'] != null) ? map['id'] : null;
    medicalSpeciality =
        (map['medical_speciality'] != Null ? map['medical_speciality'] : '');
    name = (map['name'] != Null ? map['name'] : '');
    ocupation = (map['ocupation'] != Null ? map['ocupation'] : '');
    age = (map['age'] != Null ? map['age'] : '');
    shift = (map['shift'] != Null ? map['shift'] : '');
  }
//Convert to map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['medical_speciality'] = medicalSpeciality;
    map['name'] = name;
    map['ocupation'] = ocupation;
    map['age'] = age;
    map['shift'] = shift;
    return map;
  }

  //To get the doctors
  Future<List<Doctor>> getDoctors() async {
    List<Doctor> doctors = [];
    DBHelper dbHelper = DBHelper();
    List<Map<String, dynamic>> doctorsDB = await dbHelper.dbQuery('doctors');
    for (int i = 0; i < doctorsDB.length; i++) {
      doctors.add(Doctor.fromMap(doctorsDB[i]));
    }
    return doctors;
  }
//Save doctors do the DB
  saveDoctor(Doctor doctor) async {
    DBHelper dbHelper = DBHelper();
    dbHelper.dbInsert('doctors', doctor.toMap());
  }
}
