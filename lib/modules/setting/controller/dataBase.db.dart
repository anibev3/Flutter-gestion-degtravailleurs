import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

// flutter pub add sqflite
// If you run the above command in your editor terminal, it will install the latest version.
// We will create a file called sql_helper.dart

class SQLHelper {
// Data Table
// Inside this class, we will create a class name SQLHelper and then put a method name createTables().

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

// // <-------------------------------------------->
// Here mention the data table name items and the fields in the table. We have four fields
//     id,
//     title,
//     description
//     createdAt
// database.execute does the magic of creating table in app local storage. As we create the table we also mention the data type.
// // <-------------------------------------------->

//  Create a DB
// Then we will create a db() method, this db() would call createTables() method.
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbtech.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

// // <-------------------------------------------->

// db() method would get called in every CRUD operations of SQLITE.
// Inside openDatabase() you should mention your database name.

// Data Insert
// After that we create a method for insert data operation in the storage.

  static Future<int> createItem(String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': description};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

//   We pass title and description from onPressed of floatingActionButton. Before that we will create TextController.
// We need to insert data in Map format. So we save the data in a data variable
// We used conflictAlgorithm to avoid any kind duplication data entry.

// Get All Data
// Now we will see how to get data from the storage of SQLFLITE. We will get all the data. We will use db.query() method to get data, this method is used to get lots of data or a single data from sqlite.

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

//   Get Specific Data
// Here we will see how to get a specific item based on ID. Same as the above example we will use db.query(). In this case, we will send the ID to query() function and return data that matches with the ID.

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

// Data Update
// Let's see how to udate an item. If you want to update an item you would call db.update() method(). Just like other db.query() it takes a Map of items. Items are string or object. In this case are passing strings in a form of Map.

  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // delete an item by id
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint(
          "Quelque chose s'est mail passé lor de la suppression, voici l'erreur : $err");
    }
  }
}
