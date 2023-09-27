import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/Footer.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Services/PlatformServices.dart';
import 'package:vbbm/Components/VoucherPanel/VoucherMenu.dart';

/// Our Main Screen or Home
class VoucherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        drawerEnableOpenDragGesture:
        PlatFormServices.isMobile(context) ? true : false,
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderPanel(),
                      SizedBox(height: 20,),
                      boldBlackText('Data Voucher BBM BPBD DIY'),
                      Divider(),
                      VoucherMenu(),
                      Footer()
                    ]))));
  }
}
