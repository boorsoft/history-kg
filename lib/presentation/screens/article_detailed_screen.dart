import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/presentation/utils/constans.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/models/article.dart';
import '../widgets/app_bar.dart';

class ArticleDetailedScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailedScreen({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         top: false,
        child: Column(
          children: [
            CustomAppBar(
              article.title,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Html(
                      data: article.text,
                      onLinkTap: (_, __, ___, ____) async {
                        if (await canLaunchUrl(Uri.parse(API_URL))) {
                          await launchUrl(
                            Uri.parse(API_URL),
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                    ),
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
