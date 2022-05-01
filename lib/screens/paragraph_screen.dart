import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
  late String data = "";

  @override
  void initState() {
    getParagraph();
    super.initState();
  }

  void getParagraph() async {
    try {
      data = await paragraphsService.fetchParagraphById(widget.id);
      setState(() {});
      print(data);
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
          children: [CustomAppBar(widget.title), MarkdownBody(data: data)],
        ),
      ),
    ));
  }
}
