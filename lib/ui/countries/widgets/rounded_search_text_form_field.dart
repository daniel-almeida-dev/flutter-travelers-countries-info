import 'package:flutter/material.dart';

class RoundedSearchTextFormField extends StatelessWidget {
  const RoundedSearchTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        child: TextFormField(
          onChanged: (valor) {},
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Color.fromARGB(255, 46, 165, 188),
          ),
          enableSuggestions: true,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Procurar paises',
            contentPadding: const EdgeInsets.only(left: 20),
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 46, 165, 188),
                  width: 0),
            ),
            suffixIcon: const Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
