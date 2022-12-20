import 'package:flutter/material.dart';
import 'package:song_flix/Screens/listCategories/list_categories.dart';
import 'package:song_flix/config/consts.dart';
import 'package:song_flix/components/index.dart';
import 'package:song_flix/models/categories_model.dart';
import 'package:song_flix/repositories/videos_repository.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  VideosRepository videosRepository = VideosRepository();

  TextEditingController urlController = TextEditingController();
  CategoriesModel? category;

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
                  "Cadastre um vídeo",
                  style: TextStyle(
                    color: kTextBody,
                    fontSize: fsTitleH1,
                  ),
                ),
                SizedBox(height: size.height * 0.06 ),
                FormInput(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  hintText: "Insira a url do video",
                  title: "URL:",
                  controller: urlController,
                ),
                SizedBox(height: size.height * 0.04 ),
                RoundedButton(
                  title: 'Add Categoria', 
                  onClick: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const ListCategories()) 
                    ).then((value) {
                      setState(() => category = value);
                    });
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
                    fontSize: fsTextBig,
                  ),
                ),
                SizedBox(height: size.height * 0.02 ),
                category != null ?
                VideoItemRecomended(category: category!, videoUrl: urlController.text)
                :Image.asset(
                  'assets/images/no_video.png',
                  width: size.width * 0.8,
                ),
                SizedBox(height: size.height * 0.02 ),
                RoundedButton(
                  title: 'Cadastrar', 
                  onClick: (){
                    // cadastrar novo video
                    if (category == null) return;
                    if (urlController.text.isEmpty) return;
                    videosRepository.save(categoryId: category!.categoryId, urlVideo: urlController.text);
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

