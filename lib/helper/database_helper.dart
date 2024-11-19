import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "expense_db.db";
  static const _databaseVersion = 1;

  static const table = "Expenses";
  static const columnId = "id";
  static const columnTitle = 'Title';
  static const columnAmount = 'Amount';
  static const columnCategory = 'Category';
  static const columnDate = 'Date';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);

  //   if (await databaseExists(path)) {
  //   await deleteDatabase(path);
  // }

    return await openDatabase(path, version: _databaseVersion,
        onCreate: (db, version) async {
      await db.execute('DROP TABLE IF EXISTS $table');
      await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnAmount INTEGER NOT NULL,
            $columnCategory TEXT NOT NULL,
            $columnDate TEXT NOT NULL
          )
          ''');
    });
  }

  //to insert into database
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return db.insert(table, row);
  }

  //to read from database
  Future<dynamic> read() async {
    Database db = await database;
    return db.query(table);
  }
}
