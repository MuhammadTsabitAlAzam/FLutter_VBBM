import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoucherForm extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  const VoucherForm({
    Key? key,
    required this.image,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 105, height: 60,),
            SizedBox(height: 10,),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                hintText: "Jumlah",
                hintStyle: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
