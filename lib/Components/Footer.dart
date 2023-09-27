import 'package:flutter/material.dart';
import 'package:vbbm/Reusable_Components/texts.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Jika lebar layar lebih besar dari 600, gunakan Column
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldWhiteFooterText("Administrasi Perkantoran"),
                          SizedBox(height: 10),
                          normalWhiteFooterText(
                              "BPBD DIY \nJalan Kenari No. 14A, Semaki, Umbulharjo \nYogyakarta, 55166 \nTelp. (0274)555836 \nFax. (0274)554206 \nemail: BPBD@jogjaprov.go.id"),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(width: _width / 10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldWhiteFooterText("Sosial Media"),
                          SizedBox(height: 5),
                          footerIcon('assets/icon/instagram.png', "@bpbd_diy"),
                          footerIcon('assets/icon/facebook.png', "Pusdalops BPBD DIY"),
                          footerIcon('assets/icon/twitter.png', "@BPBDDIY"),
                          footerIcon('assets/icon/youtube.png', "@BPBD DIY"),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Jika lebar layar lebih kecil dari atau sama dengan 600, gunakan ListView
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldWhiteFooterText("Administrasi Perkantoran"),
                    SizedBox(height: 10),
                    normalWhiteFooterText(
                        "BPBD DIY \nJalan Kenari No. 14A, Semaki, Umbulharjo \nYogyakarta, 55166 \nTelp. (0274)555836 \nFax. (0274)554206 \nemail: BPBD@jogjaprov.go.id"),
                    SizedBox(height: 20),
                    boldWhiteFooterText("Sosial Media"),
                    SizedBox(height: 5),
                    footerIcon('assets/icon/instagram.png', "@bpbd_diy"),
                    footerIcon('assets/icon/facebook.png', "Pusdalops BPBD DIY"),
                    footerIcon('assets/icon/twitter.png', "@BPBDDIY"),
                    footerIcon('assets/icon/youtube.png', "@BPBD DIY"),
                    SizedBox(height: 15),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget footerIcon(String imgPath, String footerText) => Align(
    alignment: Alignment.topLeft,
    child: Row(
      children: [
        Image.asset(
          imgPath,
          height: 20,
          width: 20,
        ),
        SizedBox(width: 5),
        normalWhiteFooterText(footerText)
      ],
    ),
  );
}