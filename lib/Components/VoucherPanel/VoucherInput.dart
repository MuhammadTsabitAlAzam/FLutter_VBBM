import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vbbm/Components/VoucherPanel/Components/VoucherForm.dart';
import 'package:vbbm/Models/histori_models.dart';
import 'package:vbbm/Models/voucher_models.dart';
import 'package:vbbm/Reusable_Components/formDate.dart';
import 'package:vbbm/Reusable_Components/formText.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/LaporanScreen.dart';
import 'package:vbbm/Services/PlatformServices.dart';
import 'package:vbbm/api/histori_api.dart';
import 'package:vbbm/api/voucher_api.dart';

class VoucherInput extends StatefulWidget {
  const VoucherInput({Key? key}) : super(key: key);

  @override
  State<VoucherInput> createState() => _VoucherInputState();
}

class _VoucherInputState extends State<VoucherInput> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late double _width;
  final _dualima = TextEditingController();
  final _limapuluh = TextEditingController();
  final _seratus = TextEditingController();
  final _nama = TextEditingController();
  final _bagian = TextEditingController();
  final _tanggal = TextEditingController();

  @override
  void dispose() {
    _dualima.dispose();
    _limapuluh.dispose();
    _seratus.dispose();
    _nama.dispose();
    _bagian.dispose();
    _tanggal.dispose();
    super.dispose();
  }

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
              SizedBox(height: 10),
              boldBlackText("Input Pengambilan Voucher"),
              Divider(),
              SizedBox(height: 10),
              FormText(_nama,"Masukkan Nama Pengambil", "Nama"),
              SizedBox(height: 10),
              FormText(_bagian, "Masukkan Bagian Pegawai", "Bagian"),
              SizedBox(height: 10),
              FormDate(controller: _tanggal),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: regularBlackText("Input Jumlah Voucher"),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 15),
                      PlatFormServices.isMobile(context)
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VoucherForm(image: 'assets/icon/25k.png', controller: _dualima),
                          SizedBox(height: 15),
                          VoucherForm(image: 'assets/icon/50k.png', controller: _limapuluh),
                          SizedBox(height: 15),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: VoucherForm(image: 'assets/icon/25k.png', controller: _dualima)),
                          SizedBox(width: 10),
                          Expanded(child: VoucherForm(image: 'assets/icon/50k.png', controller: _limapuluh)),
                        ],
                      ),
                      SizedBox(height: 15),
                      VoucherForm(image: 'assets/icon/100k.png', controller: _seratus),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: _width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(220, 106, 0, 1),
                  ),
                  onPressed: () async {
                    String nama = _nama.text;
                    String bagian = _bagian.text;
                    String tanggal = _tanggal.text;
                    int dualima = _dualima.text.isNotEmpty ? int.parse(_dualima.text) : 0;
                    int limapuluh = _limapuluh.text.isNotEmpty ? int.parse(_limapuluh.text) : 0;
                    int seratus = _seratus.text.isNotEmpty ? int.parse(_seratus.text) : 0;

                    if (nama.isEmpty || bagian.isEmpty || tanggal.isEmpty) {
                      _showWarningSnackBar( "Harap isi semua field terlebih dahulu.");
                    } else {
                      Voucher voucher = Voucher(
                        nama: nama,
                        bagian: bagian,
                        tanggal_pengambilan: tanggal,
                        dualima: dualima,
                        limapuluh: limapuluh,
                        seratus: seratus,
                      );

                      Histori histori = Histori(
                        nama: nama,
                        bagian: bagian,
                        tanggal: tanggal,
                        dualima: dualima,
                        limapuluh: limapuluh,
                        seratus: seratus,
                        jenis: "Ambil",
                      );

                      Response response2 = await ApiServiceHistori().createHistori(histori);
                      Response response = await ApiServiceVoucher().createPengambilan(voucher);

                      if (response.statusCode == 200 && response2.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Submit data Success"),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LaporanPage()),
                        );
                      } else {
                        print("Failed with status code: ${response.statusCode}, ${response2.statusCode}");
                      }
                    }
                  },
                  child: regularWhiteText("Submit"),
                ),
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


