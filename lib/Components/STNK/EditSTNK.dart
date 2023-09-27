import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vbbm/Models/stnk_models.dart';
import 'package:vbbm/Reusable_Components/formDate.dart';
import 'package:vbbm/Reusable_Components/formText.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/ListSTNKScreen.dart';
import 'package:vbbm/api/stnk_api.dart';

class EditSTNK extends StatefulWidget {
  final int id;
  final String nama_kendaraan;
  final String plat_nomor;
  final String tanggal;


  EditSTNK({
    required this.id,
    required this.nama_kendaraan,
    required this.plat_nomor,
    required this.tanggal,
  });

  @override
  _EditSTNKState createState() => _EditSTNKState();
}

class _EditSTNKState extends State<EditSTNK> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late double _width;
  final _nama_kendaraan = TextEditingController();
  final _plat_nomor = TextEditingController();
  final _tanggal = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nama_kendaraan.text = widget.nama_kendaraan;
    _plat_nomor.text = widget.plat_nomor;
    _tanggal.text = widget.tanggal;
  }

  @override
  void dispose() {
    _nama_kendaraan.dispose();
    _plat_nomor.dispose();
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
              boldBlackText("Edit Data STNK"),
              Divider(),
              SizedBox(height: 10),
              FormText(_nama_kendaraan,"Masukkan Nama Kendaraan", "Nama Kendaraan"),
              SizedBox(height: 10),
              FormText(_plat_nomor, "Masukkan Plat Nomor", "Plat Nomor"),
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
                    String nama_kendaraan = _nama_kendaraan.text;
                    String plat_nomor = _plat_nomor.text;
                    String tanggal = _tanggal.text;

                    STNK stnk = STNK(
                      id: widget.id,
                      nama_kendaraan: nama_kendaraan,
                      plat_nomor: plat_nomor,
                      tanggal: tanggal, );

                    Response response2 = await ApiServiceSTNK().updateSTNK(stnk);

                    if (response2.statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Edit data Success"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListSTNKPage()),
                      );
                    } else {
                      print("Failed with status code: ${response2.statusCode}");
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
}
