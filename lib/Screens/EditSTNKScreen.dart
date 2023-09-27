import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Components/STNK/EditSTNK.dart';
import 'package:vbbm/Services/PlatformServices.dart';

/// Our Main Screen or Home
class EditSTNKPage extends StatelessWidget {
  final int id;
  final String nama_kendaraan;
  final String plat_nomor;
  final String tanggal;

  EditSTNKPage({
    required this.id,
    required this.nama_kendaraan,
    required this.plat_nomor,
    required this.tanggal,});

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
                      EditSTNK(
                        id: id,
                        nama_kendaraan: nama_kendaraan,
                        plat_nomor: plat_nomor,
                        tanggal: tanggal,),
                    ]))));
  }
}
