import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_app/providers/task.dart';

class DatabaseHelper {
  final date;
  DatabaseHelper(this.date);

  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    print(_db);
    if (_db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + 'tasks.db';

      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print('Creating a new one');
          return db.execute('CREATE TABLE $_tableName('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title STRING,note TEXT,date STRING,'
              'color INTEGER,completed INTEGER'
              ')');
        },
      );
      print(_db);
    } catch (error) {
      print(error);
    }
  }

  static Future<int> insert(Task task) async {
    print('entered insert');
    return await _db!.insert(_tableName, task.toJson());
  }

  Future<List<Map<String, dynamic>>> query() async {
    return await _db!
        .query(_tableName,
            columns: ['id', 'title', 'note', 'color', 'Date', 'completed'],
            where: 'Date =?',
            whereArgs: [date])
        .catchError((onError) {
      print(onError);
    });
  }

  static Future<void> delete(Task task) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static Future<void> update(int? id, int? completed) async {
    if (completed == 1) {
      await _db!
          .rawUpdate('UPDATE $_tableName SET completed=? WHERE id=?', [0, id]);
    } else {
      await _db!
          .rawUpdate('UPDATE $_tableName SET completed=? WHERE id=?', [1, id]);
    }
  }
}
