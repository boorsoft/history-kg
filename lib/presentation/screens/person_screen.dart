import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:history_kg/services/persons_service.dart';


import '../utils/styles.dart';
import '../widgets/app_bar.dart';

class PersonScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final int id;

  const PersonScreen(this.firstName, this.lastName, this.id, {Key? key})
      : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  PersonsService personsService = PersonsService();
  Map<String, dynamic> personsData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPerson();
  }

  Future<void> getPerson() async {
    personsData = await personsService.fetchPersonById(widget.id);

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
                  CustomAppBar("${widget.firstName} ${widget.lastName}"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Html(
                          data: personsData['bio'].toString(),
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
