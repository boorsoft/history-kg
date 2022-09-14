import 'package:flutter/material.dart';
import 'package:history_kg/services/paragraphs_service.dart';

import '../utils/styles.dart';
import '../widgets/app_bar.dart';
import '../widgets/failure.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => getParagraphs());
    getParagraphs();
  }

  Future<void> getParagraphs() async {
    paragraphsData = await paragraphsService.fetchParagraphs();

    // await Future.wait(paragraphsData
    //     .map((data) => cachedImage(context, data['image']))
    //     .toList());
    setState(() {
      isLoading = false;
    });
  }

  // Future cachedImage(BuildContext context, String imageUrl) =>
  //     precacheImage(CachedNetworkImageProvider(imageUrl), context);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return circularIndicator;
    } else {
      if (paragraphsData[0] == 'no internet' || paragraphsData[0] == '500') {
        return Failure(paragraphsData[0], 'Параграфы');
      }
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const CustomAppBar('Параграфы'),
              Expanded(
                child: ListView.separated(
                    itemCount: paragraphsData.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          color: Colors.white,
                        ),
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
}
