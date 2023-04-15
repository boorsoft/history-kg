import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/state/persons_bloc/persons_bloc.dart';
import 'package:history_kg/presentation/widgets/app_failure.dart';
import 'package:history_kg/presentation/widgets/shimmer_generator.dart';

import '../widgets/person_image_button.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonsBloc, PersonsState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is PersonsLoadingState)
              const ShimmerGenerator(
                count: 3,
                axisDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 15),
                height: 230,
                width: 160,
              ),
            if (state is PersonsLoadedState)
              SizedBox(
                height: 230,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.persons.length < 5
                      ? state.persons.length - 1
                      : 5 - 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var person = state.persons[index + 1];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: PersonsImageButton(person),
                    );
                  },
                ),
              ),
            if (state is PersonsErrorState) Failure(state.error)
          ],
        );
      },
    );
  }
}
