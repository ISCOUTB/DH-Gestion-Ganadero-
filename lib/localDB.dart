import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:informacion_animal/animal_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => instance;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'app_data.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        // Crear tabla de usuarios
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT NOT NULL,
            email TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');

        // Crear tabla de animales
        await db.execute('''
          CREATE TABLE animals(
            id TEXT PRIMARY KEY,
            breed TEXT,
            weight TEXT,
            birthDate TEXT,
            status TEXT,
            gender TEXT,
            isYoung TEXT,
            motherId TEXT,
            vaccinationStatus TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Método para insertar un nuevo animal
  Future<int> insertAnimal(Animal animal) async {
    final db = await database;
    return await db.insert(
      'animals',
      animal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Otros métodos de la base de datos
  Future<int> insertUser(String username, String email, String password) async {
    final db = await database;
    return await db.insert(
      'users',
      {'username': username, 'email': email, 'password': password},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> validateUser(String username, String password) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  Future<bool> userExists(String username, String email) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? OR email = ?',
      whereArgs: [username, email],
    );
    return result.isNotEmpty;
  }
}


