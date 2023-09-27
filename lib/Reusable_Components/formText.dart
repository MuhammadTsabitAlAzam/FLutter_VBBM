import 'package:flutter/material.dart';

Widget FormText(TextEditingController controller, String hintText, String labelText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Color.fromRGBO(220, 106, 0, 1),
          width: 3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      contentPadding: const EdgeInsets.all(22),
      hintText: hintText,
      labelText: labelText,
      hintStyle: const TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

Widget NoClickFormText(String labelText) {
  return TextFormField(
    decoration: InputDecoration(
      enabled: false,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Color.fromRGBO(220, 106, 0, 1),
          width: 3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      contentPadding: const EdgeInsets.all(10),
      labelText: labelText,
      hintStyle: const TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

Widget LoginTextField(TextEditingController controller, String hintText, String labelText) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Color.fromRGBO(220, 106, 0, 1),
          width: 3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      contentPadding: const EdgeInsets.all(22),
      hintText: hintText,
      labelText: labelText,
      hintStyle: const TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
