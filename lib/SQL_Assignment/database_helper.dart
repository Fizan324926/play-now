import 'package:cric_scoring/modal/ball_record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
// import 'note.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database; // Singleton Database

  String cricketTable = 'cricket_table';
  String colId = 'id';
  String colBallNo = 'ballno';
  String colOverNo = 'overno';
  String colScore = 'score';
  String colBowler = 'bowler';
  String colBatsman = 'batsman';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cricket.db';

    // Open/create the database at a given path
    var cricketDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return cricketDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $cricketTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colBallNo INTEGER, '
        '$colOverNo INTEGER, $colScore INTEGER, $colBowler TEXT, $colBatsman TEXT)');
  }

  Future<List<Map<String, dynamic>>> getBallRecordMapList() async {
    Database db = await database;

    var result = await db.query(cricketTable, orderBy: '$colOverNo ASC');
    return result;
  }

  Future<int> insertBallRecord(BallRecord ballRecord) async {
    Database db = await database;
    var result = await db.insert(cricketTable, ballRecord.toMap());
    return result;
  }

  Future<int> updateBallRecord(BallRecord ball) async {
    var db = await database;
    var result = await db.update(cricketTable, ball.toMap(),
        where: '$colId = ?', whereArgs: [ball.id]);
    return result;
  }

  Future<int> deleteBallRecord(int id) async {
    var db = await database;
    int result =
        await db.rawDelete('DELETE FROM $cricketTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $cricketTable');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }

  Future<List<BallRecord>> getNoteList() async {
    var ballRecordMapList =
        await getBallRecordMapList(); // Get 'Map List' from database
    int count =
        ballRecordMapList.length; // Count the number of map entries in db table

    List<BallRecord> ballRecordList = [];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      ballRecordList.add(BallRecord.fromMapObject(ballRecordMapList[i]));
    }

    return ballRecordList;
  }
}

// class DatabaseHelper {
//   static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
//   static Database? _database; // Singleton Database
//
//   String noteTable = 'note_table';
//   String colId = 'id';
//   String colTitle = 'title';
//   String colDescription = 'description';
//   String colPriority = 'priority';
//   String colDate = 'date';
//
//   DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
//
//   factory DatabaseHelper() {
//     _databaseHelper ??= DatabaseHelper._createInstance();
//     return _databaseHelper!;
//   }
//
//   Future<Database> get database async {
//     _database ??= await initializeDatabase();
//     return _database!;
//   }
//
//   Future<Database> initializeDatabase() async {
//     // Get the directory path for both Android and iOS to store database.
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'notes.db';
//
//     // Open/create the database at a given path
//     var notesDatabase =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     return notesDatabase;
//   }
//
//   void _createDb(Database db, int newVersion) async {
//     await db.execute(
//         'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
//         '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
//   }
//
//   // Fetch Operation: Get all note objects from database
//   Future<List<Map<String, dynamic>>> getNoteMapList() async {
//     Database db = await database;
//
//     var result = await db.query(noteTable, orderBy: '$colPriority ASC');
//     return result;
//   }
//
//   // Insert Operation: Insert a Note object to database
//   Future<int> insertNote(Note note) async {
//     Database db = await database;
//     var result = await db.insert(noteTable, note.toMap());
//     return result;
//   }
//
//   // Update Operation: Update a Note object and save it to database
//   Future<int> updateNote(Note note) async {
//     var db = await database;
//     var result = await db.update(noteTable, note.toMap(),
//         where: '$colId = ?', whereArgs: [note.id]);
//     return result;
//   }
//
//   // Delete Operation: Delete a Note object from database
//   Future<int> deleteNote(int id) async {
//     var db = await database;
//     int result =
//         await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
//     return result;
//   }
//
//   // Get number of Note objects in database
//   Future<int> getCount() async {
//     Database db = await database;
//     List<Map<String, dynamic>> x =
//         await db.rawQuery('SELECT COUNT (*) from $noteTable');
//     int result = Sqflite.firstIntValue(x)!;
//     return result;
//   }
//
//   // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
//   Future<List<Note>> getNoteList() async {
//     var noteMapList = await getNoteMapList(); // Get 'Map List' from database
//     int count =
//         noteMapList.length; // Count the number of map entries in db table
//
//     List<Note> noteList = [];
//     // For loop to create a 'Note List' from a 'Map List'
//     for (int i = 0; i < count; i++) {
//       noteList.add(Note.fromMapObject(noteMapList[i]));
//     }
//
//     return noteList;
//   }
// }
