import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vbbm/Models/stnk_models.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/EditSTNKScreen.dart';
import 'package:vbbm/Screens/ListSTNKScreen.dart';
import 'package:vbbm/api/stnk_api.dart';

import '../../Reusable_Components/confirmationMessage.dart';

class ListSTNK extends StatefulWidget {
  @override
  _ListSTNKState createState() => _ListSTNKState();
}

class _ListSTNKState extends State<ListSTNK> {
  ApiServiceSTNK apiService = ApiServiceSTNK();
  List<STNK> stnk = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSTNK();
  }

  Future<void> fetchSTNK() async {
    try {
      await apiService.getDayleft();
      List<STNK> fetchedSTNK = await apiService.getSTNK();
      setState(() {
        stnk = fetchedSTNK;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching vouchers: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  late double _height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          height: _height - 20,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : stnk.isEmpty
              ? Center(child: Text("Tidak Ada Data Pengambilan"))
              : ListView.builder(
            itemCount: stnk.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(stnk[index].id.toString()),
                direction: DismissDirection.horizontal,
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    return ConfirmationMessage.showConfirmationDialog(
                      context,
                      'Konfirmasi',
                      'Apakah Anda yakin ingin menghapus STNK ini?',
                      'Hapus',
                    );
                  }
                  return true;
                },
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    await ApiServiceSTNK().deleteSTNK(stnk[index].id);
                    setState(() {
                      stnk.removeAt(index);
                    });
                  } else if (direction == DismissDirection.startToEnd) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditSTNKPage(
                        id: stnk[index].id,
                        nama_kendaraan: stnk[index].nama_kendaraan,
                        plat_nomor: stnk[index].plat_nomor,
                        tanggal: stnk[index].tanggal,
                      ),
                    ));
                  }
                },
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          mediumBlackText2(
                              stnk[index].dayleft.toString()),
                          mediumBlackText2("Days Left")
                        ],
                      ),
                      tileColor: Color.fromRGBO(220, 106, 0, 0.02),
                      title: mediumBlackText2(
                          stnk[index].nama_kendaraan),
                      subtitle: mediumBlackText2(
                          "Plat Nomor: ${stnk[index].plat_nomor}"),
                      trailing:
                      Column(
                        children: [
                          mediumBlackText2(stnk[index].tanggal),
                          SizedBox(height: 5,),
                          Container(
                            height: 20,
                            width: 90,
                            child: ElevatedButton(onPressed: () async {
                                bool? addyear = await ConfirmationMessage.showConfirmationDialog(
                                    context,
                                    "Konfirmasi Pajak",
                                    "Apakah Anda yakin Sudah Melakukan Pajak Pada Kendaraan Ini?",
                                    "Sudah"
                                );
                                if (addyear == true) {
                                  await ApiServiceSTNK().addYear(stnk[index].id);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ListSTNKPage()));
                                }
                              },
                                style: ElevatedButton.styleFrom(primary: Colors.green,),
                                child: buttonWhiteText("Selesai")),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
