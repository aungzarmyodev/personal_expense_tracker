import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseDb {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await _initDB();

    return _db!;
  }

  static Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'expense.db');

    return openDatabase(
      path,
      version: 1,

      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category TEXT,
            note TEXT,
            amount REAL,
            date TEXT
          )
        ''');
      },
    );
  }
}
