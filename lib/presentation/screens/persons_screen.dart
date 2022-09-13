import 'package:flutter/material.dart';
import 'package:history_kg/services/persons_service.dart';

import '../utils/styles.dart';
import '../widgets/app_bar.dart';
import '../widgets/failure.dart';
import '../widgets/person_image_button.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  List<dynamic> personsData = [];
  bool isLoading = true;
  PersonsService personsService = PersonsService();

  @override
  void initState() {
    super.initState();
    getPersons();
  }

  Future<void> getPersons() async {
    personsData = await personsService.fetchPersons();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return circularIndicator;
    } else {
      if (personsData[0] == 'no internet' || personsData[0] == '500') {
        return Failure(personsData[0], 'Параграфы');
      }
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const CustomAppBar('Параграфы'),
              Expanded(
                child: GridView.builder(
                  itemCount: personsData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var person = personsData[index];

                    return PersonsImageButton(
                      person['id'],
                      person['firstName'],
                      person['lastName'],
                      person['bio'],
                      imagePath: person['image'],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
