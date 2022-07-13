import 'package:flutter/material.dart';

class RoundedGradientButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final GlobalKey<FormState> formLoginKey;

  const RoundedGradientButton(
      {Key? key, required this.onPressed, required this.formLoginKey, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 1), blurRadius: 8.0)
          ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color.fromARGB(255, 46, 165, 188),
            Color.fromARGB(255, 92, 236, 163),
          ],
        ),
        color: Colors.deepPurple.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size(500, 50)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          bool validator = formLoginKey.currentState!.validate();

          if (validator) {
            onPressed();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
