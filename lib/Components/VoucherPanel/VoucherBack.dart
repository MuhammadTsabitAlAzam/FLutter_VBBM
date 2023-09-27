import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vbbm/Components/VoucherPanel/Components/VoucherData.dart';
import 'package:vbbm/Components/VoucherPanel/Components/VoucherForm.dart';
import 'package:vbbm/Models/histori_models.dart';
import 'package:vbbm/Reusable_Components/formDate.dart';
import 'package:vbbm/Reusable_Components/formText.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Services/PlatformServices.dart';
import '../../Reusable_Components/confirmationMessage.dart';
import '../../Screens/LaporanScreen.dart';
import '../../api/histori_api.dart';
import '../../api/voucher_api.dart';

class VoucherBack extends StatefulWidget {
  final int id;
  final String nama;
  final String bagian;
  final String tanggal_pengambilan;
  final String? tanggal_pengembalian;
  final int dualima;
  final int limapuluh;
  final int seratus;
  VoucherBack({
    Key? key,
    required this.id,
    required this.nama,
    required this.bagian,
    required this.tanggal_pengambilan,
    this.tanggal_pengembalian,
    required this.dualima,
    required this.limapuluh,
    required this.seratus,
  }) : super(key: key);

  @override
  State<VoucherBack> createState() => _VoucherBackState();
}

final _BduaPuluhLima = TextEditingController();
final _BlimaPuluh = TextEditingController();
final _Bseratus = TextEditingController();
final _tanggal = TextEditingController();

class _VoucherBackState extends State<VoucherBack> {

  late double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0, bottom: 10.0),
        child: Container(
          width: _width - 20,
          child: Column(
            children: [
              SizedBox(height: 10,),
              boldBlackText("Pengembalian Voucher"),
              Divider(),
              SizedBox(height: 10,),
              Align(alignment: Alignment.centerLeft, child: regularBlackText2("Nama"), ),
              NoClickFormText(widget.nama),
              SizedBox(height: 20,),
              Align(alignment: Alignment.centerLeft, child: regularBlackText2("Bagian"), ),
              NoClickFormText(widget.bagian),
              SizedBox(height: 10,),
              FormDate(controller: _tanggal),
              SizedBox(height: 10,),
              Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: regularBlackText(
                          "Jumlah Voucher yang Diambil",
                        ),
                      ),
                      SizedBox(height: 20,),
                      PlatFormServices.isMobile(context) ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VoucherData(image: 'assets/icon/25k.png', jumlah: widget.dualima,),
                          VoucherData(image: 'assets/icon/50k.png', jumlah: widget.limapuluh,),
                          VoucherData(image: 'assets/icon/100k.png', jumlah: widget.seratus,),
                        ],
                      ) : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VoucherData(image: 'assets/icon/25k.png', jumlah: widget.dualima,),
                          VoucherData(image: 'assets/icon/50k.png', jumlah: widget.limapuluh,),
                          VoucherData(image: 'assets/icon/100k.png', jumlah: widget.seratus,),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: regularBlackText(
                          "Input Jumlah Voucher",
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 15,),
                      PlatFormServices.isMobile(context)
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VoucherForm(
                              image: 'assets/icon/25k.png',
                              controller: _BduaPuluhLima),
                          SizedBox(height: 15,),
                          VoucherForm(
                              image: 'assets/icon/50k.png',
                              controller: _BlimaPuluh),
                          SizedBox(height: 15,),
                        ],
                      )
                          : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: VoucherForm(
                                  image: 'assets/icon/25k.png',
                                  controller: _BduaPuluhLima),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: VoucherForm(
                                  image: 'assets/icon/50k.png',
                                  controller: _BlimaPuluh),
                            )
                          ]),
                      SizedBox(height: 15,),
                      VoucherForm(
                          image: 'assets/icon/100k.png', controller: _Bseratus),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 50,
                width: _width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(220, 106, 0, 1)),
                    onPressed: () async {
                      String tanggal = _tanggal.text.toString();
                      int dualima = _BduaPuluhLima.text.isNotEmpty ? int.parse(_BduaPuluhLima.text) : 0;
                      int limapuluh = _BlimaPuluh.text.isNotEmpty ? int.parse(_BlimaPuluh.text) : 0;
                      int seratus = _Bseratus.text.isNotEmpty ? int.parse(_Bseratus.text) : 0;

                      if (tanggal.isEmpty) {
                        _showWarningSnackBar("Harap isi field tanggal terlebih dahulu");
                      } else {
                        if ((dualima + limapuluh + seratus) !=
                            (widget.dualima + widget.limapuluh +
                                widget.seratus)) {
                          bool? confirm = await ConfirmationMessage
                              .showConfirmationDialog(
                              context, 'Konfirmasi Jumlah Voucher',
                              'Jumlah voucher yang diambil tidak sama dengan jumlah voucher yang akan dikembalikan. Lanjutkan pengembalian voucher?',
                              "Lanjutkan");
                          if (!confirm!) {
                            return;
                          }
                        }

                        Histori histori = Histori(
                            nama: widget.nama,
                            bagian: widget.bagian,
                            tanggal: tanggal,
                            dualima: dualima,
                            limapuluh: limapuluh,
                            seratus: seratus,
                            jenis: "Kembali");

                        Response response = await ApiServiceHistori()
                            .createHistori(histori);
                        Response response2 = await ApiServiceVoucher()
                            .updateVoucher(widget.id, tanggal);
                        if (response.statusCode == 200 &&
                            response2.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Submit data success"),
                            ),);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  LaporanPage()));
                        } else {
                          print("Failed with status code: ${response2
                              .statusCode}");
                        }
                      }
                    },
                    child:regularWhiteText("Submit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showWarningSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red, // Warna latar belakang merah untuk peringatan
      ),
    );
  }
}
