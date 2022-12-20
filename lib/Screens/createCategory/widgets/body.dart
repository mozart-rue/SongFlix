import 'package:flutter/material.dart';
import 'package:song_flix/config/consts.dart';
import 'package:song_flix/components/index.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/repositories/categories_repository.dart';
import 'package:uuid/uuid.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  CategoriesRepository categoriesRepository = CategoriesRepository();

  Color pickerColor = const  Color(0xFF443a49);
  bool isColorChanged = false;
  String newCategoryName = "";
  var uuid = const Uuid();

  void onColorChanged(Color color) {
    setState(() => pickerColor = color);
  }

  void onChangeCategoryName(String name) {
    setState(() => newCategoryName = name);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Cadastrar Categoria",
                  style: TextStyle(
                    color: kTextBody,
                    fontSize: fsTitleH1,
                  ),
                ),
                SizedBox(height: size.height * 0.06 ),
                FormInput(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  onChanged: onChangeCategoryName,
                  hintText: "Insira o nome ...",
                  title: "Nome da Categoria:",
                ),
                SizedBox(height: size.height * 0.04 ),
                RoundedButton(
                  title: 'Definir cor', 
                  onClick: (){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: kHintText,
                          title: const Text(
                            'Escolha uma cor',
                            style: TextStyle(
                              color: kTitulo,
                              fontSize: fsText,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor, 
                              onColorChanged: onColorChanged,
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isColorChanged = true;
                                });
                                Navigator.of(context).pop(pickerColor);
                              }, 
                              child: const Text('Definir cor'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  backgroundColor: kInputField,
                  radius: 12,
                  fontSize: fsNormal,
                ),
                SizedBox(height: size.height * 0.04 ),
                const Text(
                  "Preview",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: kTextBody,
                    fontSize: fsNormal,
                  ),
                ),
                SizedBox(height: size.height * 0.02 ),
                RoundedButton(
                  title: newCategoryName, 
                  onClick: (){},
                  radius: 12,
                  backgroundColor: pickerColor,
                ),
                SizedBox(height: size.height * 0.14),
                RoundedButton(
                  title: 'Cadastrar', 
                  onClick: () async {
                    // Fazer a o cadastro no banco de dados
                    CategoriesModel categoryToInsert = CategoriesModel(
                      categoryId: uuid.v4(),
                      nameCategory: newCategoryName,
                      colorCategory: pickerColor,
                    );

                    int idProcess = await categoriesRepository.save(categoryToInsert);

                    if(idProcess.isNaN) {
                      return;
                    }

                   Navigator.of(context).pop();
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  backgroundColor: kTitulo,
                  radius: 12,
                  fontSize: fsNormal,
                ),
                SizedBox(height: size.height * 0.02 ),
                RoundedButton(
                  title: 'Cancelar', 
                  onClick: (){
                    Navigator.of(context).pop();
                  },
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  backgroundColor: kHintText,
                  radius: 12,
                  fontSize: fsNormal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

