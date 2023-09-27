import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Components/VoucherPanel/EditVoucher.dart';
import 'package:vbbm/Services/PlatformServices.dart';

/// Our Main Screen or Home
class EditVoucherPage extends StatelessWidget {
  final int id;
  final String nama;
  final String bagian;
  final String tanggal;
  final int dualima;
  final int limapuluh;
  final int seratus;
  final String jenis;

  EditVoucherPage({
    required this.id,
    required this.nama,
    required this.bagian,
    required this.tanggal,
    required this.dualima,
    required this.limapuluh,
    required this.seratus,
    required this.jenis});

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
                      VoucherEdit(
                          id: id,
                          nama: nama,
                          bagian: bagian,
                          tanggal: tanggal,
                          dualima: dualima,
                          limapuluh: limapuluh,
                          seratus: seratus,
                          jenis: jenis),
                    ]))));
  }
}
