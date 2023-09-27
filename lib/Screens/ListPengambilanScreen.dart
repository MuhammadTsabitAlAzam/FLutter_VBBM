import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Components/VoucherPanel/ListPengambilan.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Services/PlatformServices.dart';

/// Our Main Screen or Home
class ListPengambilanPage extends StatelessWidget {
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
                      SizedBox(height: 10,),
                      boldBlackText("Data Pengembalian Voucher"),
                      Divider(),
                      SizedBox(height: 10,),
                      ListPengambilan(),
                    ]))));
  }
}
