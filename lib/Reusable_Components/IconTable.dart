import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Screens/EditScreen.dart';
import '../api/histori_api.dart';
import 'confirmationMessage.dart';

Widget tableIcons(BuildContext context, int id,String nama, String bagian, String tanggal, int dualima, int limapuluh, int seratus, String jenis, int? jumlah ,Function refreshCallback) => Container(
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    child: Row(
      children: [
        IconButton(
            onPressed: () async {
              bool? shouldDelete = await ConfirmationMessage.showConfirmationDialog(
                  context,
                  "Hapus Data",
                  "Apakah Anda yakin Ingin Menghapus Data ini?",
                  "Hapus"
              );
              if (shouldDelete == true) {
                Response response = await ApiServiceHistori().deleteHistori(id);
                refreshCallback();
              }
            },
            icon: Icon(Icons.delete)),
        IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditVoucherPage(
                      id: id,
                      nama: nama,
                      bagian: bagian,
                      tanggal: tanggal,
                      dualima: dualima,
                      limapuluh: limapuluh,
                      seratus: seratus,
                      jenis: jenis),
                ),
              );
            },
            icon: Icon(Icons.edit)),
      ],
    ),
  ),
);