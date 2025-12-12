import 'package:sqflite/sqflite.dart';
import '../../../database/db_helper.dart';


class VehicleRepository {
  final dbInstance = DbInstance.instance;

  Future<int> insertSelectedVehicle(Map<String, dynamic> data) async {
    final db = await dbInstance.database;
    return await db.insert('selected_vehicle', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> fetchSelectedVehicles() async {
    final db = await dbInstance.database;
    return await db.query('selected_vehicle');
  }

  Future<int> deleteSelectedVehicle(int id) async {
    final db = await dbInstance.database;
    return await db.delete('selected_vehicle',
        where: 'id = ?', whereArgs: [id]);
  }
}
