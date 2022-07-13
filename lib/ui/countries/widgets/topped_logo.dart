import 'package:flutter/material.dart';

class ToppedLogo extends StatelessWidget {
  const ToppedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 70,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/named_logo.png"),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
