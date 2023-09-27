import 'package:flutter/material.dart';
import 'package:vbbm/Reusable_Components/texts.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: _width,
      height: _height-100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            landingTitle("Aplikasi Manajemen Kendaraan"),
            SizedBox(height: 10,),
            landingSubTitle("Badan Penanggulangan Bencana Daerah (BPBD)\nDaerah Istimewa Yogyakarta",),
            SizedBox(height: 30,),
            Expanded(child: Image.asset('assets/images/bpbd.png', height: 275, width: 275,),),
            /*Image.asset('assets/images/bpbd.png', height: 300, width: 300,),*/
            // SizedBox(width: 30,)
          ],
        ),
      ),
    );
  }
}
