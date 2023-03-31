import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLJointureHelper {
  // ...

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE worker(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        fonction TEXT,
        salary DOUBLE,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);

    await database.execute("""CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        etat TEXT,
        userId INTEGER NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      )
      """);
  }

  static Future<void> createUserTable(sql.Database database) async {
    await database.execute("""CREATE TABLE worker(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        fonction TEXT,
        salary DOUBLE,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<void> createTasksTable(sql.Database database) async {
    await database.execute("""CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        etat TEXT,
        userId INTEGER NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbtecht_join__.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createUserTable(database);
        await createTasksTable(database);
      },
    );
  }

  /*
  TRAVAILLEURS
  - Créer un travailleur
  - Afficher un travailleur
  - Afficher les taches d'un travailleur
  - Modifier un travailleur
  - Supprimer un travailleur
  - Supprimer plusieurs travailleurs
  - Rechercher un travailleur


  TACHES
  - Créer une tache
  - Afficher un tache
  - Modifier un tache
  - Supprimer un tache
  - Supprimer plusieurs taches
  */

  static Future<int> createWorker(
      String name, String? fonction, double? salary) async {
    final db = await SQLJointureHelper.db();

    final data = {
      'name': name,
      'fonction': fonction,
      'salary': salary,
    };
    final id = await db.insert('worker', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getworkers() async {
    final db = await SQLJointureHelper.db();
    return db.query('worker', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getworker(int id) async {
    final db = await SQLJointureHelper.db();
    return db.query('worker', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateWorker(
      int id, String name, String? fonction, double? salary) async {
    final db = await SQLJointureHelper.db();

    final data = {
      'name': name,
      'fonction': fonction,
      'salary': salary,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('worker', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteWorker(int id) async {
    final db = await SQLJointureHelper.db();
    try {
      await db.delete("worker", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint(
          "Quelque chose s'est mail passé lor de la suppression, voici l'erreur : $err");
    }
  }

// <--------------------------------------------------------------------->

/* une fonction qui prend l'identifiant de l'utilisateur en paramètre et 
renvoie la liste de toutes les tâches associées à cet utilisateur */
  static Future<List<Map<String, dynamic>>> getTasksByUser(int userId) async {
    final db = await SQLJointureHelper.db();
    return db.query('tasks',
        where: "user_id = ?", whereArgs: [userId], orderBy: "id");
  }

  Future<void> createTask(
      String? title, String? description, String? etat, int? userId) async {
    final db = await SQLJointureHelper.db();

    final data = {
      'title': title,
      'description': description,
      'etat': etat,
      'userId': userId,
    };
    await db.insert('tasks', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await SQLJointureHelper.db();
    return db.query('tasks', orderBy: "id");
  }

//   Get Specific Data
// Here we will see how to get a specific item based on ID. Same as the above example we will use db.query(). In this case, we will send the ID to query() function and return data that matches with the ID.

  static Future<List<Map<String, dynamic>>> getTask(int id) async {
    final db = await SQLJointureHelper.db();
    return db.query('tasks', where: "id = ?", whereArgs: [id], limit: 1);
  }

// Data Update
// Let's see how to udate an item. If you want to update an item you would call db.update() method(). Just like other db.query() it takes a Map of tasks. tasks are string or object. In this case are passing strings in a form of Map.

  // Update an item by id
  static Future<int> updateTask(
    int id,
    String title,
    String? description,
    String? etat,
    // int? userId
  ) async {
    final db = await SQLJointureHelper.db();

    final data = {
      'title': title,
      'description': description,
      'etat': etat,
      // 'userId': userId,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('tasks', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // delete an item by id
  static Future<void> deleteTask(int id) async {
    final db = await SQLJointureHelper.db();
    try {
      await db.delete("tasks", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint(
          "Quelque chose s'est mal passé lor de la suppression, voici l'erreur : $err");
    }
  }
}
