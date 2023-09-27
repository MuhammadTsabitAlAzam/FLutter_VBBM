import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/HomePage.dart';
import 'package:vbbm/Screens/LoginPageScreen.dart';
import 'package:vbbm/Screens/MenuSTNKScreen.dart';
import 'package:vbbm/Screens/VoucherPage.dart';
import 'package:vbbm/Services/PlatformServices.dart';

import 'package:vbbm/Screens/LaporanScreen.dart';

import '../Reusable_Components/confirmationMessage.dart';

class HeaderPanel extends StatelessWidget {
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: PlatFormServices.isMobile(context) ? 70 : 110,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(220, 106, 0, 1),
        child: PlatFormServices.isMobile(context)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(flex: 1),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 45,
                      child: Image.asset(
                          'assets/images/logo_bpbd_horizontal.png')),
                  Spacer(flex: 1),
                  InkWell(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 30,
                        child: Image.asset('assets/icon/main_menu.png')),
                    onTap: () => Scaffold.of(context).openDrawer(),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 150,
                        child: Image.asset('assets/images/logo_bpbd.png')),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: menuText('Beranda')),
                    SizedBox(width: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoucherPage()),
                          );
                        },
                        child: menuText('Data Voucher')),
                    SizedBox(width: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LaporanPage()),
                          );
                        },
                        child: menuText('Laporan')),
                    SizedBox(width: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => STNKMenuPage()),
                          );
                        },
                        child: menuText('STNK')),
                  SizedBox(width: 20,),
                  TextButton(
                    onPressed: () async {
                      bool? shouldLogOut = await ConfirmationMessage.showConfirmationDialog(
                        context,
                        'Konfirmasi Keluar',
                        'Apakah Anda yakin ingin keluar?',
                        'Keluar',
                      );
                      if (shouldLogOut == true) {
                        _logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreenPage()),
                        );
                      }
                    },
                    child: menuText('Log Out'),
                  )
                ]));
  }
}
