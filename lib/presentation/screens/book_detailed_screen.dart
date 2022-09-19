import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../utils/constans.dart';

class BookDetailedScreen extends StatefulWidget {
  final int id;
  final String url;
  const BookDetailedScreen(this.id, this.url, {Key? key}) : super(key: key);

  @override
  State<BookDetailedScreen> createState() => _BookDetailedScreenState();
}

class _BookDetailedScreenState extends State<BookDetailedScreen> {
  late PDFDocument pdfDocument;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getPDF();
  }

  void getPDF() async {
    setState(() {
      isLoading = true;
    });
    pdfDocument = await PDFDocument.fromURL('$API_URL/books/${widget.url}');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              )
            : PDFViewer(
                document: pdfDocument,
                enableSwipeNavigation: true,
                progressIndicator:
                    CircularProgressIndicator(color: accentColor),
              ),
      ),
    );
  }
}
