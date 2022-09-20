import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/quiz_bloc/quiz_bloc.dart';
import '../utils/styles.dart';
import '../widgets/quiz_image_button.dart';

class QuizMenuScreen extends StatelessWidget {
  const QuizMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoadingState) {
            SizedBox(
              height: 230,
              child: Center(
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              ),
            );
          }
          if (state is QuizLoadedState) {
            return SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: state.quizes.length < 3 ? state.quizes.length : 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var quiz = state.quizes[index];

                  return QuizImageButton(quiz);
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
