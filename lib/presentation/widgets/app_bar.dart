import 'package:flutter/material.dart';
import 'package:history_kg/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? isHome;
  const CustomAppBar(this.title, {this.isHome = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 90,
        width: double.infinity,
        color: const Color(0xFFF9F9FF),
        child: Row(
          children: [
            isHome == false
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Image.asset(
                        "assets/images/Back Button.jpg",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 45,
                  ),
            Container(
              width: MediaQuery.of(context).size.width - 70,
              alignment: Alignment.center,
              child: Text(
                title,
                style: appBarTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
