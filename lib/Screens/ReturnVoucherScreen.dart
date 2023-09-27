import 'package:flutter/material.dart';
import 'package:vbbm/Components/DrawerMenu.dart';
import 'package:vbbm/Components/HeaderPanel.dart';
import 'package:vbbm/Components/VoucherPanel/VoucherBack.dart';
import 'package:vbbm/Services/PlatformServices.dart';

/// Our Main Screen or Home
class ReturnVoucherPage extends StatelessWidget {
  final int id;
  final String nama;
  final String bagian;
  final String tanggal_pengambilan;
  final String? tanggal_pengembalian;
  final int dualima;
  final int limapuluh;
  final int seratus;

  ReturnVoucherPage({
    super.key,
    required this.id,
    required this.nama,
    required this.bagian,
    required this.tanggal_pengambilan,
    this.tanggal_pengembalian,
    required this.dualima,
    required this.limapuluh,
    required this.seratus,
  });

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
                      VoucherBack(
                          id: id,
                          nama: nama,
                          bagian: bagian,
                          tanggal_pengambilan : tanggal_pengambilan,
                          tanggal_pengembalian: tanggal_pengembalian,
                          dualima: dualima,
                          limapuluh: limapuluh,
                          seratus: seratus
                      ),
                    ]))));
  }
}
