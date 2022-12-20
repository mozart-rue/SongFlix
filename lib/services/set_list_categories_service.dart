import 'package:flutter/cupertino.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:uuid/uuid.dart';

setListCategoriesService() {

    var uuid = Uuid();

    List<CategoriesModel> categories = [
      CategoriesModel(
        nameCategory: "Front End",
        colorCategory: const Color(0xFF5781EF),
        categoryId: uuid.v4(),
      ),
      CategoriesModel(
        nameCategory: "Mobile",
        colorCategory: const Color(0xFF19940F),
        categoryId: uuid.v4(),
      ),
      CategoriesModel(
        nameCategory: "Programação",
        colorCategory: const Color(0xFFD82D2D),
        categoryId: uuid.v4(),
      ),
      CategoriesModel(
        nameCategory: "Data Science",
        colorCategory: const Color(0xFFFACC15),
        categoryId: uuid.v4(),
      ),
    ];

    return categories;
}
