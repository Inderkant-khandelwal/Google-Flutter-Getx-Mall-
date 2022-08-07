import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io' as io;

class Dbconfig {
  static Future<Database>? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = createDb();
      return _db;
    }
  }

  Future<Database> createDb() async {
    io.Directory docDir = await getApplicationDocumentsDirectory();
    String dbpath = join(docDir.path, "Prod.db");
    var database = await openDatabase(dbpath, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database database, int version) async {
    await database.execute(
        "CREATE TABLE Products (pid INTEGER PRIMARY KEY AUTOINCREMENT , pro_name TEXT NOT NULL , pro_price INTEGER NOT NULL , pro_img TEXT NOT NULL, pro_qty INTEGER NOT NULL)");
  }

  // add single product to sqf database
  Future<dynamic> addProduct(product) async {
    var dbClient = await db;
    await dbClient?.insert("Products", product);
    return product;
  }

  // get all product from sqf database
  Future<dynamic> getProFromSqlite() async {
    var dbClient = await db;
    final List<Map<String, Object?>> res = await dbClient!.query("Products");
    return res.toList();
  }

  // delete specific product from sqf database
  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    final isDeleted =
        await dbClient!.delete("Products", where: 'pid = ?', whereArgs: [id]);
    return isDeleted;
  }
}
