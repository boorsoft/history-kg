import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../domain/models/person.dart';
import '../widgets/app_bar.dart';

class PersonScreen extends StatelessWidget {
  final Person person;

  const PersonScreen(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CustomAppBar("${person.firstName} ${person.lastName}"),
            Expanded(
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Html(data: person.bio),
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
