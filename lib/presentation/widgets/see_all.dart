import 'package:flutter/material.dart';

import '../utils/styles.dart';

class SeeAll extends StatelessWidget {
  final String title;
  final String route;
  const SeeAll(this.title, this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Row(
        children: [
          Text(
            title,
            style: titleTS.copyWith(fontSize: 18),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(route);
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Row(
              children: [
                Text(
                  "Показать все",
                  style: seeAllTS,
                ),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
