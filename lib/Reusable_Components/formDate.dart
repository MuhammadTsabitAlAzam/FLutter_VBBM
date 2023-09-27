import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDate extends StatefulWidget {
  final TextEditingController controller;
  const FormDate({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FormDate> createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now.toLocal());

    return TextFormField(
      controller: widget.controller,
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
        hintText: formattedDate,
        labelText: "Tanggal",
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        suffixIcon: Icon(Icons.calendar_today),

      ),
      readOnly: true,
      onTap: () async{
        DateTime? pickDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().toLocal(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickDate != null){
          String formattedDatePick = DateFormat('yyyy-MM-dd').format(pickDate);
          setState(() {
            widget.controller.text = formattedDatePick;
          });
        }
        else {
          widget.controller.text = formattedDate;
        }
      },
    );
  }
}
