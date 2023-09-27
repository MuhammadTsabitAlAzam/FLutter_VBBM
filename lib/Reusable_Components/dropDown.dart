import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String value;
  final Function(String?) onChanged;
  final List<String> itemList; // Tambahkan parameter untuk daftar item

  CustomDropdown({
    required this.value,
    required this.onChanged,
    required this.itemList, // Tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: itemList // Gunakan daftar item yang diberikan
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
