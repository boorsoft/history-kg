import 'package:flutter/material.dart';
import 'package:history_kg/services/paragraphs_service.dart';
import 'package:history_kg/utils/constans.dart';
import 'package:history_kg/utils/styles.dart';
import 'package:history_kg/widgets/app_bar.dart';

import '../widgets/paragraph_image_button.dart';

class ParagraphsScreen extends StatefulWidget {
  const ParagraphsScreen({Key? key}) : super(key: key);

  @override
  State<ParagraphsScreen> createState() => ParagraphsState();
}

class ParagraphsState extends State<ParagraphsScreen> {
  List<dynamic> paragraphsData = [];
  bool isLoading = true;

  ParagraphsService paragraphsService = ParagraphsService();

  @override
  void initState() {
    super.initState();
    getParagraphs();
  }

  Future<void> getParagraphs() async {
    try {
      paragraphsData = await paragraphsService.fetchParagraphs();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? circularIndicator
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  const CustomAppBar('Параграфы'),
                  Expanded(
                    child: ListView.builder(
                        itemCount: paragraphsData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var paragraph = paragraphsData[index];

                          return ParagraphImageButton(
                            paragraph['title'],
                            paragraph['id'],
                            imagePath: paragraph['image'],
                          );
                        }),
                  )
                ],
              ),
            ),
          );
  }
}
