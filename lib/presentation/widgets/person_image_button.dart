import 'package:flutter/material.dart';

import '../screens/person_screen.dart';

class PersonsImageButton extends StatelessWidget {
  final int id;
  final String firstName;
  final String lastName;
  final String bio;
  final String? imagePath;

  const PersonsImageButton(this.id, this.firstName, this.lastName, this.bio,
      {Key? key, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PersonScreen(firstName, lastName, id)));
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(22),
                bottom: Radius.circular(10),
              ),
              child: Image(
                image: Image.network(
                  imagePath!,
                ).image,
                width: 129,
                height: 223,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: 161,
                height: 36,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xFF5547F0),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0xff33333340).withOpacity(0.25),
                      blurRadius: 4.0,
                      offset: const Offset(0, 4.0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text(
                    "$firstName $lastName",
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
      ),
    );
  }
}
