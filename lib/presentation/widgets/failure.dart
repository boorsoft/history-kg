import 'package:flutter/material.dart';
import 'package:history_kg/presentation/widgets/app_bar.dart';

import '../utils/styles.dart';

class Failure extends StatelessWidget {
  final String message;
  final String title;
  const Failure(this.message, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: [
              CustomAppBar(title),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              message == 'no internet'
                  ? Icon(
                      Icons.signal_wifi_connected_no_internet_4_outlined,
                      color: const Color(0xFF28254A).withOpacity(0.2),
                      size: 130,
                    )
                  : Icon(
                      Icons.mood_bad,
                      color: const Color(0xFF28254A).withOpacity(0.2),
                      size: 130,
                    ),
              const SizedBox(
                height: 15,
              ),
              message == 'no internet'
                  ? Text("Отсутствует поключение к интернету",
                      style: failureMessageTextStyle)
                  : Text(
                      "Не удалось загрузить данные",
                      style: failureMessageTextStyle,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
