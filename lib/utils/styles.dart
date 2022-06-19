import 'package:flutter/material.dart';
import 'package:history_kg/widgets/failure.dart';

TextStyle appBarTextStyle = const TextStyle(
  color: Color(0xFF28254A),
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

TextStyle failureMessageTextStyle = TextStyle(
  color: const Color(0xFF28254A).withOpacity(0.7),
  fontSize: 17,
  fontWeight: FontWeight.w400,
);

Widget circularIndicator = Container(
  color: const Color(0xFFE5E5E5),
  child: const Center(
    child: CircularProgressIndicator(color: Color(0xFF5547F0)),
  ),
);

Color wrongAnswerColor = const Color(0xFFFF7888);
Color correctAnswerColor = const Color(0xFF81FFC2);
Color correctUnselectedColor = const Color(0xFFb2d6e0);
Color primaryAnswerColor = const Color(0xFFF9F9FF);
