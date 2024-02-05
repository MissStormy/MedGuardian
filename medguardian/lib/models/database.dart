import 'package:sqflite/sqflite.dart';

//helper para la base de datos
class DBHelper {
  static Database? _database;
  static const String dbName = "medguardian.db";

  //iniciar la base de datos
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _dbInitialize();
    return _database;
  }

  //consultar la tabla entera en la base de datos
  Future<List<Map<String, dynamic>>> dbQuery(String table) async {
    Database? db = await database;
    var result = await db!.query(table);
    return result;
  }

  //consulta con sql
  Future<List<Map<String, dynamic>>> sqlQuery(String sql) async {
    Database? db = await database;
    var result = await db!.rawQuery(sql);
    return result;
  }

  //insertar datos en la base de datos
  Future<int> dbInsert(String table, Map<String, dynamic> row) async {
    Database? db = await database;
    var result = await db!.insert(table, row);
    return result;
  }

  //eliminar datos de la base de datos
  Future<int> dbDelete(String table, int id) async {
    Database? db = await database;
    var result = await db!.delete(table, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //actualizar datos de la base de datos
  Future<int> bdUpdate(String table, Map<String, dynamic> row) async {
    Database? db = await database;
    var result = 0;
    if (db != null) {
      result =
          await db.update(table, row, where: 'id = ?', whereArgs: [row['id']]);
    }

    return result;
  }

  _dbInitialize() async {
    var folder = await getDatabasesPath();
    String path = folder + dbName;
    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print('inicializando BD');
      await db.execute(
          "CREATE TABLE IF NOT EXISTS appointment(id INTEGER PRIMARY KEY, medical_speciality TEXT, doctor TEXT, place TEXT, date TEXT)");
      await db.execute(
          "CREATE TABLE IF NOT EXISTS doctors(id INTEGER PRIMARY KEY, medical_speciality TEXT, name TEXT, ocupation TEXT, age INTEGER, shift TEXT)");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Berg Ottas', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Ottas Berg', 'Doctor', 53, 'Night')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Doctor Cito', 'Nurse', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Maria Unpajjot', 'Nurse', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Debora Meltrozo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Kerry Caverga', 'Nurse', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Jala Melano', 'Nurse', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Maite Tazas', '', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Khepo John', '', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('urgencies','Khagas Awa', '', 53, 'Day')");

      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('radiology','Chern Oville', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('radiology','Mela Khaskan', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('radiology','Thomas Thurbado', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('radiology','Lola Mento', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('radiology','Ben Dover', 'Doctor', 53, 'Day')");

      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Gregorio Casas', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Elba Surero', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Elsa Pataco', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Susana Oria', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Calvo Roto', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('laboratory','Don Limpio', 'Doctor', 53, 'Day')");

      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Mina Botieso', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Doctor Who', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Fista Nalparti', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Rosa Melltoto', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Paul Bazzo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Mary Condo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Beth Amelnabo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('traumatology','Leek Maballs', 'Doctor', 53, 'Day')");

      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('grastric','Kepa Jamecho', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('grastric','Lisa Melchoto', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('grastric','Alex Cremento', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('grastric','Elmor Ciyon', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('grastric','Ming Atiesa', 'Doctor', 53, 'Day')");

      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Demen Ciasenil', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Tama Lhitos', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Tobu Cake', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Juancho Razo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Cindy Hentes', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Amy Mhir', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Elga Tillazo', 'Doctor', 53, 'Day')");
      await db.execute(
          "INSERT INTO doctors(medical_speciality,name,ocupation,age,shift) VALUES('orthopedy', 'Elma Nubrio', 'Doctor', 53, 'Day')");

      //para añadir mas tablas
      // await db.execute(
      //   "CREATE TABLE Resultados(id INTEGER PRIMARY KEY, jugador1 TEXT, j1set1 TEXT, j1set1 TEXT)"
      // );

      await db.execute(
          "CREATE TABLE IF NOT EXISTS pirulas(id INTEGER PRIMARY KEY, name TEXT, brand TEXT, dose TEXT, type TEXT, amountPerBox INTEGER, withFood BOOLEAN, withoutFood BOOLEAN, withOtherPirula BOOLEAN, currentQuantity INTEGER)");
      await db.execute(
          "INSERT INTO pirulas(name, brand, dose, type, amountPerBox, withFood, withoutFood, withOtherPirula, currentQuantity) VALUES('Droga plutonica','abararban', 'una pastilla cuando haga falta', 'psicotropica',8,FALSE,FALSE,FALSE,8)");
      await db.execute(
          "INSERT INTO pirulas(name, brand, dose, type, amountPerBox, withFood, withoutFood, withOtherPirula, currentQuantity) VALUES('Patata Frita','Patata', 'Un par, lo curan todo, siempre que no tengas nada que curar','God',20,FALSE,FALSE,FALSE,20)");

      await db.execute(
          "CREATE TABLE IF NOT EXISTS treatments(id INTEGER PRIMARY KEY, pirulaName TEXT, startDate TEXT, endDate TEXT, frecuency INTEGER)");

      await db.execute(
          "INSERT INTO treatments(pirulaName, startDate, endDate, frecuency) VALUES('Droga plutonica','2012-02-27 13:27:00.123456789z','2032-02-27 13:27:00.123456789z',24)");
      await db.execute(
          "INSERT INTO treatments(pirulaName, startDate, endDate, frecuency) VALUES('Patata Frita','2012-02-27 13:27:00.123456789z','2032-02-27 13:27:00.123456789z',24)");
    });
    print('BD inicalizada');
    return database;
  }
}
