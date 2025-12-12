import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbInstance {
  DbInstance._privateConstructor();
  static final DbInstance instance = DbInstance._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE selected_vehicle (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        vehicleName TEXT,
        vehicleModel TEXT
      )
    ''');
  }
}
