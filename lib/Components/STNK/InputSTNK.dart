import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vbbm/Models/stnk_models.dart';
import 'package:vbbm/Reusable_Components/formDate.dart';
import 'package:vbbm/Reusable_Components/formText.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/ListSTNKScreen.dart';
import 'package:vbbm/api/stnk_api.dart';

class InputSTNK extends StatefulWidget {
  const InputSTNK({Key? key}) : super(key: key);

  @override
  State<InputSTNK> createState() => _InputSTNKState();
}

class _InputSTNKState extends State<InputSTNK> {
  late double _width;
  final _namakendaraan = TextEditingController();
  final _platNomor = TextEditingController();
  final _tanggal = TextEditingController();

  @override
  void dispose() {
    _namakendaraan.dispose();
    _platNomor.dispose();
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
              FormText(_namakendaraan,"Masukkan Nama/Jenis Kendaraan", "Nama Kendaraan"),
              SizedBox(height: 10),
              FormText(_platNomor, "Masukkan Plat Nomor", "Plat Nomor"),
              SizedBox(height: 10),
              FormDate(controller: _tanggal),
              SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: _width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(220, 106, 0, 1),
                  ),
                  onPressed: () async {
                    String nama_kendaraan = _namakendaraan.text;
                    String plat_nomor = _platNomor.text;
                    String tanggal = _tanggal.text;

                    if (nama_kendaraan.isEmpty || plat_nomor.isEmpty || tanggal.isEmpty) {
                      _showWarningSnackBar( "Harap isi semua field terlebih dahulu.");
                    } else {
                      STNK stnk = STNK(
                        nama_kendaraan: nama_kendaraan,
                        plat_nomor: plat_nomor,
                        tanggal: tanggal,
                      );

                      Response response = await ApiServiceSTNK().createSTNK(stnk);

                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Submit data Success"),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListSTNKPage()),
                        );
                      } else {
                        print("Failed with status code: ${response.statusCode}");
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


