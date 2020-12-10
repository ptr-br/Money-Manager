import 'dart:async';
import 'dart:io';
import '../models/entry.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static final _dbName = "MoneyManagerDatabaseIncomeAndExpenses.db";
  static final _dbTableName = "MoneyManagerDBaseIncomeAndExpenses";
  static final _dbVersion = 1;


  // singelton class
  DBProvider._privateConstructor();
  static final DBProvider instnace = DBProvider._privateConstructor();


  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          print('Creating the database for your manager');
          await db.execute(
             '''
             CREATE TABLE $_dbTableName(
             timestamp String PRIMARY KEY,
             type String,
             date String ,
             person TEXT,   
             cardName TEXT,  
             icon INTEGER,
             description TEXT,
             expense REAL
             )
             '''
          );
        });
  }

 // CRUD-methods
  newEntry(Entry newEntry) async {
    //print('Primary Key is timestamp: ${newEntry.timestamp}');
    //print(newEntry.date);
    //print(newEntry.icon);
    //print(newEntry.expense);
    //print(newEntry.cardName);
    //print(newEntry.description);
    //print(newEntry.type);
    final db = await instnace.database;
    //print('after\n\n\n');
    var res = await db.insert(_dbTableName, newEntry.toMap());
    return res;
  }

  getEntry(String date) async {
    final db = await instnace.database;
    var res =await  db.query(_dbTableName, where: "date = ?", whereArgs: [date]);
    return res.isNotEmpty ? Entry.fromMap(res.first) : Null ;
  }

  Future<List> getEntrysByMonth(String date, bool isExpense) async {
    final db = await instnace.database;
    List<String> _splitList = date.split("-");
    String _month = _splitList[0] + "-" + _splitList[1];

    if (isExpense) {
      var res = await db.rawQuery(
          "SELECT * From $_dbTableName WHERE date LIKE '$_month%' AND type='expense' ");
      List<Entry> list = res.isNotEmpty ? res.map((c) => Entry.fromMap(c))
          .toList() : [];
      return list;
    } else {
      var res = await db.rawQuery(
          "SELECT * From $_dbTableName WHERE date LIKE '$_month%' AND type='income'");
      List<Entry> list = res.isNotEmpty ? res.map((c) => Entry.fromMap(c))
          .toList() : [];
      return list;
    }
  }

  Future<List> getAllEntrys() async {
    final db = await instnace.database;
    var res = await db.query(_dbTableName);
    List<Entry> list = res.isNotEmpty ? res.map((c) => Entry.fromMap(c)).toList() : [];
    return list;
  }

  updateEntry(Entry newEntry) async {
    final db = await instnace.database;
    var res = await db.update(_dbTableName, newEntry.toMap(),
        where: "date = ?", whereArgs: [newEntry.date]);
    return res;
  }

  deleteEntry(String date) async {
    final db = await instnace.database;
    db.delete(_dbTableName, where: "date = ?", whereArgs: [date]);

  }
}