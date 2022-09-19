import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:history_kg/presentation/utils/styles.dart';

import '../../domain/models/person.dart';
import '../screens/person_screen.dart';

class PersonsImageButton extends StatelessWidget {
  final Person person;

  const PersonsImageButton(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => PersonScreen(person)));
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              person.image,
              fit: BoxFit.cover,
              height: 230,
              width: 160,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                height: 53,
                width: 160,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: personContainerColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Text(
                  "${person.firstName} ${person.lastName}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFF9F9FF),
                    fontSize: 14,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
