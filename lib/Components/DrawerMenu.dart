import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/LoginPageScreen.dart';
import 'package:vbbm/Screens/MenuSTNKScreen.dart';
import 'package:vbbm/Screens/VoucherPage.dart';
import 'package:vbbm/Screens/LaporanScreen.dart';
import 'package:vbbm/Screens/HomePage.dart';

import '../Reusable_Components/confirmationMessage.dart';

class DrawerMenu extends StatelessWidget {
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromRGBO(220, 106, 0, 1),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                      width: 200,
                      color: Color.fromRGBO(220, 106, 0, 1),
                      child: Image.asset('assets/images/logo_bpbd_horizontal.png')),
                  Divider(height: 5, thickness: 2, color: Colors.white),
                  ListTile(title: mediumWhiteText('Beranda'), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
                  ListTile(title: mediumWhiteText('Data Voucher'), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VoucherPage()),
                    );
                  }),
                  ListTile(title: mediumWhiteText('Laporan'), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaporanPage()),
                    );
                  }),
                  ListTile(title: mediumWhiteText('STNK'), onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => STNKMenuPage()),
                    );
                  }),
                  ListTile(
                    title: mediumWhiteText('Log Out'),
                    onTap: () async {
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
                  ),
                ])));
  }
}
