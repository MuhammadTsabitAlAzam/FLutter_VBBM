import 'package:flutter/material.dart';
import 'package:vbbm/Models/voucher_models.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/Screens/ReturnVoucherScreen.dart';
import 'package:vbbm/api/voucher_api.dart';

class ListPengambilan extends StatefulWidget {
  @override
  _ListPengambilanState createState() => _ListPengambilanState();
}

class _ListPengambilanState extends State<ListPengambilan> {
  ApiServiceVoucher apiService = ApiServiceVoucher();
  List<Voucher> vouchers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVouchers();
  }

  Future<void> fetchVouchers() async {
    try {
      List<Voucher> fetchedVouchers = await apiService.getPengambilan();
      setState(() {
        vouchers = fetchedVouchers;
        isLoading = false; // Loading selesai ketika data berhasil diambil
      });
    } catch (e) {
      print("Error fetching vouchers: $e");
      setState(() {
        isLoading = false; // Loading selesai dengan atau tanpa kesalahan
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
              ? Center(child: CircularProgressIndicator()) // Indikator loading
              : vouchers.isEmpty
              ? Center(child: Text("Tidak Ada Data Pengambilan")) // Pesan jika datanya kosong
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subBlackText(
                "List Data Pengambilan Voucher yang Belum Dikembalikan",
              ),
              SizedBox(height: 20), // Spasi antara teks dan list card
              Expanded(
                child: ListView.builder(
                  itemCount: vouchers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReturnVoucherPage(
                            id: vouchers[index].id,
                            nama: vouchers[index].nama,
                            bagian: vouchers[index].bagian,
                            tanggal_pengambilan: vouchers[index].tanggal_pengambilan,
                            dualima: vouchers[index].dualima,
                            limapuluh: vouchers[index].limapuluh,
                            seratus: vouchers[index].seratus,
                          ),
                        ));
                      },
                      child: Card(
                        child: ListTile(
                          tileColor: Color.fromRGBO(220, 106, 0, 0.02),
                          title: mediumBlackText2(vouchers[index].nama),
                          subtitle: mediumBlackText2("Bagian: ${vouchers[index].bagian}"),
                          trailing: mediumBlackText2(vouchers[index].tanggal_pengambilan),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
