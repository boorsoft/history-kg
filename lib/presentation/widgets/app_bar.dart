import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool? isHome;
  const CustomAppBar(this.title, {this.isHome = false, Key? key})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        height: 120,
        width: double.infinity,
        color: accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
              // : MediaQuery.of(context).size.width * 0.55,
              child: Row(
                mainAxisAlignment: widget.isHome!
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (widget.isHome == false)
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.chevron_left,
                          color: primaryClor,
                          size: 30,
                        ),
                      ),
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: appBarTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 17),
              padding: const EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                color: textFieldBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Поиск",
                  hintStyle: hintTS,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
