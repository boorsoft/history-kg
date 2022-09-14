import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/services/paragraphs_service.dart';

import '../utils/styles.dart';
import '../widgets/app_bar.dart';

class ParagraphScreen extends StatefulWidget {
  final String title;
  final int id;

  const ParagraphScreen(this.title, this.id, {Key? key}) : super(key: key);

  @override
  State<ParagraphScreen> createState() => _ParagraphScreenState();
}

class _ParagraphScreenState extends State<ParagraphScreen> {
  ParagraphsService paragraphsService = ParagraphsService();
  Map<String, dynamic> paragraphData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getParagraph();
  }

  Future<void> getParagraph() async {
    paragraphData = await paragraphsService.fetchParagraphById(widget.id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? circularIndicator
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(widget.title),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Html(
                          data: paragraphData['text'].toString(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
