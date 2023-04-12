import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/widgets/app_bar.dart';

import '../state/persons_bloc/persons_bloc.dart';
import '../utils/styles.dart';
import '../widgets/person_image_button.dart';

class PersonsAllScreen extends StatelessWidget {
  const PersonsAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const CustomAppBar("Исторические личности"),
            BlocBuilder<PersonsBloc, PersonsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state is PersonsLoadingState)
                      SizedBox(
                        height: 230,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: accentColor,
                          ),
                        ),
                      ),
                    if (state is PersonsLoadedState)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 30),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.persons.length < 5
                              ? state.persons.length - 1
                              : 5 - 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                            childAspectRatio: 3 / 4,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            var person = state.persons[index + 1];

                            return PersonsImageButton(person);
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
