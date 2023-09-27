import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Services/PlatformServices.dart';
import '../Components/STNK/ListSTNK.dart';

/// Our Main Screen or Home
class ListSTNKPage extends StatelessWidget {
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
                      boldBlackText("List Data STNK BPBD DIY"),
                      Divider(),
                      SizedBox(height: 10,),
                      Align(alignment: Alignment.centerLeft, child:  subBlackText("\tList Data Pembayaran Pajak Kendaraan BPBD DIY"),),
                      SizedBox(height: 10,),
                      ListSTNK(),
                    ]))));
  }
}
