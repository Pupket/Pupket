import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteConfig {
  static final SQLiteConfig instance = SQLiteConfig._instance();

  Database? _database;

  SQLiteConfig._instance() {
    _init();
  }

  factory SQLiteConfig() => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    await _init();
    return _database!;
  }

  Future<void> _init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'local.db'),
      version: 0,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    // String createBufferQuery = '''
    //   CREATE TABLE IF NOT EXISTS tb_buffer (
    //     uid INTEGER PRIMARY KEY AUTOINCREMENT
    //     , latitude REAL
    //     , longitude REAL
    //     , altitude REAL
    //     , bearing REAL
    //     , distance REAL
    //     , speed INTEGER
    //     , time INTEGER
    //   );
    // ''';
    // await db.execute(createBufferQuery);
  }

  static Future<void> _onUpgrade(Database db, int oldVersion, int vewVersion) async {

    if (oldVersion < 1) {

    }

    // if (oldVersion < 2) {
    //   String createLocalNotificationQuery = '''
    //   CREATE TABLE IF NOT EXISTS tb_local_notification (
    //     tbToday TEXT
    //     , tbTitleType TEXT
    //     , tbReadYn INTEGER DEFAULT 1
    //   );
    // ''';
    //   await db.execute(createLocalNotificationQuery);
    // }
  }

  static void _onConfigure(Database db) {}
}