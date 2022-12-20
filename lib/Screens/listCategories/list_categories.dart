import 'package:flutter/material.dart';
import 'package:song_flix/Screens/createCategory/create_category.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/config/consts.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/repositories/categories_repository.dart';


class ListCategories extends StatefulWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {

  CategoriesRepository categoriesRepository = CategoriesRepository();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecionar Categoria',
          style: TextStyle(
            color: kTextBody,
            fontSize: fsTextBig,
          ),
        ),
        backgroundColor: kTitulo,
      ),
      body: Background(
        child: FutureBuilder(
          future: categoriesRepository.findAll(),
          builder: (context, snapshot) {
              switch (snapshot.connectionState) {

              case ConnectionState.none: 
                break;

              case ConnectionState.active: 
                break;

              case ConnectionState.waiting: 
                return const LoadingComponent();

              case ConnectionState.done: 
                List<CategoriesModel> categories = snapshot.data as List<CategoriesModel>; 
                if (categories.isEmpty) {
                  return const ListIsEmpty();
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.095),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(categories[index]);
                        },
                        child: ListCategoriesItem(
                          category: categories[index]
                        ),
                      ),
                    );
                  },
                );
            }
            return const SomethingWentWrong();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const CreateCategory()) 
          ).then((value) => setState((){}));
        },
        backgroundColor: const Color(0xFF7B61FF),
        child: const Icon(
          Icons.add,
          size: 36,
        ),
      ),
    );
  }
}



class ListCategoriesItem extends StatelessWidget {
  final CategoriesModel category;
  const ListCategoriesItem({
    required this.category,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kHintText,
      ),
      child: Center(
        child: Text(
          category.nameCategory,
          style: TextStyle(
            color: category.colorCategory,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
