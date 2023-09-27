import 'package:flutter/material.dart';

class VoucherData extends StatelessWidget {
  final String image;
  final int jumlah;
  const VoucherData({
    Key? key,
    required this.image,
    required this.jumlah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 35, height: 20,),
            SizedBox(width: 5,),
            Text("Jumlah : "),
            Text("$jumlah")
          ],
        ),
      ),
    );
  }
}
