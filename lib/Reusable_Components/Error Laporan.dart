import 'package:flutter/material.dart';
import 'package:vbbm/Reusable_Components/texts.dart';

import '../Screens/LaporanScreen.dart';

class ErrorLaporan extends StatelessWidget {
  String text;
  ErrorLaporan({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          child: Column(
            children: [
              Text(text),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LaporanPage()),
                );
              }, child: menuText("Refresh"))
            ],
          ),
        ),
      ),
    );
  }
}
