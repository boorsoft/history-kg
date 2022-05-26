import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/services/paragraphs_service.dart';
import 'package:history_kg/widgets/app_bar.dart';

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
    try {
      paragraphData = await paragraphsService.fetchParagraphById(widget.id);
      print(paragraphData);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(widget.title),
              Html(
                data: paragraphData['text'].toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
