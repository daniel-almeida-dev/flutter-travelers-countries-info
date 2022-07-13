import 'package:flutter/material.dart';

import '../../presentation/start/start_presenter.dart';

class StartScreen extends StatelessWidget {
  static const String id = '/start';

  final StartPresenter presenter;

  const StartScreen({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Container(
            width: 250,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
