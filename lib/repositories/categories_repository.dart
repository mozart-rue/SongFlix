

import 'package:flutter/cupertino.dart';
import 'package:song_flix/database/app_database.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:sqflite/sqflite.dart';

class CategoriesRepository  {


  Future<int> save(CategoriesModel category) async {
    final Database db = await createDatabase();

    int colorValue = category.colorCategory.value;

    final Map<String, dynamic> categoryMap = {};
    categoryMap["id"] = category.categoryId;
    categoryMap["name"] = category.nameCategory;
    categoryMap["color"] = colorValue;

    return db.insert('categories', categoryMap);
  }


  Future<List<CategoriesModel>> findAll() async {
    final Database db = await createDatabase();

    final List<Map<String, dynamic>> result = await db.query('categories');
    final List<CategoriesModel> categories = [];

    for (Map<String, dynamic> row in result) {
      final Color categoryColor = Color(row["color"]);
      final CategoriesModel category = CategoriesModel(
          categoryId: row["id"],
          nameCategory: row["name"],
          colorCategory: categoryColor
        );
      categories.add(category);
    }

    return categories;
  }
  
}
