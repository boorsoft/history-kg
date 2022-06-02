import 'package:flutter/material.dart';

TextStyle appBarTextStyle = const TextStyle(
  color: Color(0xFF28254A),
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

Widget circularIndicator = Container(
  color: const Color(0xFFE5E5E5),
  child: const Center(
    child: CircularProgressIndicator(color: Color(0xFF5547F0)),
  ),
);
