import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:history_kg/presentation/widgets/app_failure.dart';
import 'package:history_kg/presentation/widgets/shimmer_generator.dart';

import '../state/quiz_bloc/quiz_bloc.dart';
import '../widgets/quiz_image_button.dart';

class QuizMenuScreen extends StatelessWidget {
  const QuizMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state is QuizLoadingState)
                const ShimmerGenerator(
                  count: 1,
                  axisDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: 15),
                  width: 360,
                  height: 120,
                ),
              if (state is QuizLoadedState)
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount:
                        state.quizes.length < 3 ? state.quizes.length : 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      var quiz = state.quizes[index];
                      return QuizImageButton(quiz, false);
                    },
                  ),
                ),
              if (state is QuizErrorState) Failure(state.error)
            ],
          );
        },
      ),
    );
  }
}
