import 'package:flutter/material.dart';
import 'package:vbbm/Models/histori_models.dart';
import 'package:vbbm/Reusable_Components/Error%20Laporan.dart';
import 'package:vbbm/Reusable_Components/dropDown.dart';
import 'package:vbbm/Reusable_Components/texts.dart';
import 'package:vbbm/api/histori_api.dart';
import '../../Reusable_Components/IconTable.dart';
import '../../Reusable_Components/dataConverter.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  late Future<List<Histori>> historiFuture;
  List<Histori> historiList = [];
  int currentPage = 0;
  int itemsPerPage = 10;
  int selectedItemsPerPage = 10;
  List<int> itemsPerPageOptions = [10, 25, 50, 100];
  int currentYear = DateTime.now().year;
  int selectedYear = DateTime.now().year;
  bool getData = true;

  @override
  void initState() {
    super.initState();
    historiFuture = getHistoriData();
  }

  void refreshData() {
    setState(() {
      currentPage = 0;
      historiFuture = getHistoriData();
    });
  }

  void nextPage() {
    setState(() {
      currentPage++;
    });
  }

  void previousPage() {
    setState(() {
      currentPage--;
    });
  }

  List<int> getYearOptions() {
    List<int> years = [];
    for (int i = currentYear - 10; i <= currentYear + 10; i++) {
      years.add(i);
    }
    return years;
  }

  String dropdownValue = 'Semua';
  String dropdownValue2 = 'Semua';
  TextEditingController _tahun = TextEditingController();
  late String jenis;
  late String tahun;
  late String bulan;
  int? totalJumlah = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return FutureBuilder<List<Histori>>(
      future: getHistoriData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorLaporan(text: "Data Tidak Ditemukan",);
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No data available"));
        } else {
          historiList = snapshot.data!;
          int startIndex = currentPage * selectedItemsPerPage;
          int endIndex = (currentPage + 1) * selectedItemsPerPage;

          totalJumlah = historiList
              .sublist(startIndex,
                  endIndex > historiList.length ? historiList.length : endIndex)
              .fold<int>(0, (total, histori) => total + histori.jumlah!);

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center, // Mengatur rata tengah
                    child: boldBlackText("Laporan Data Voucher BBM"),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        mediumBlackText2("Filter Data : "), // Teks baru
                        SizedBox(width: 20),
                        CustomDropdown(
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              refreshData();
                            });
                          },
                          itemList: [
                            'Semua',
                            'Ambil',
                            'Kembali'
                          ], // Daftar item yang ingin Anda gunakan
                        ),
                        SizedBox(width: 10),
                        CustomDropdown(
                          // Menggunakan custom Dropdown
                          value: dropdownValue2,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                              refreshData();
                            });
                          },
                          itemList: [
                            'Semua',
                            'Januari',
                            'Februari',
                            'Maret',
                            'April',
                            'Mei',
                            'Juni',
                            'Juli',
                            'Agustus',
                            'September',
                            'Oktober',
                            'November',
                            'Desember'
                          ], // Daftar item yang ingin Anda gunakan
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 70,
                          child: DropdownButtonFormField<int>(
                            value: selectedYear,
                            onChanged: (newValue) {
                              setState(() {
                                selectedYear = newValue!;
                                _tahun.text = newValue.toString();
                              });
                            },
                            items: getYearOptions()
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 10,),
                        CustomDropdown(
                          value: selectedItemsPerPage.toString(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItemsPerPage = int.parse(newValue!);
                              refreshData();
                            });
                          },
                          itemList: itemsPerPageOptions
                              .map((option) => option.toString())
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Visibility(
                    visible: getData? false : true,
                    child: ElevatedButton(
                      onPressed: getData ? null : refreshData,
                      child: Text("Refresh Data"),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Nomor')),
                        DataColumn(label: Text('Nama')),
                        DataColumn(label: Text('Bagian')),
                        DataColumn(label: Text('Tanggal')),
                        DataColumn(label: Text('Voucher 25k')),
                        DataColumn(label: Text('Voucher 50k')),
                        DataColumn(label: Text('Voucher 100k')),
                        DataColumn(label: Text('Jenis')),
                        DataColumn(label: Text('Jumlah')),
                        DataColumn(label: Text('')),
                      ],
                      rows: historiList
                          .sublist(
                              startIndex,
                              endIndex > historiList.length
                                  ? historiList.length
                                  : endIndex)
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key + startIndex;
                        Histori item = entry.value;

                        return DataRow(
                          cells: [
                            DataCell(
                              Align(
                                alignment: Alignment.center,
                                child: Text((index + 1).toString()),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.nama),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.bagian),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.tanggal),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.center,
                                child: Text(item.dualima.toString()),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.center,
                                child: Text(item.limapuluh.toString()),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.center,
                                child: Text(item.seratus.toString()),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.jenis),
                              ),
                            ),
                            DataCell(
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(item.jumlah.toString()),
                              ),
                            ),
                            DataCell(tableIcons(
                                context,
                                item.id,
                                item.nama,
                                item.bagian,
                                item.tanggal,
                                item.dualima,
                                item.limapuluh,
                                item.seratus,
                                item.jenis,
                                item.jumlah,
                                refreshData)),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      regularBlackText("Total Jumlah"),
                      SizedBox(
                        width: 20,
                      ),
                      mediumBlackText2(totalJumlah.toString()),
                      SizedBox(
                        width: _width / 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(220, 106, 0, 1),
                          ),
                          onPressed: () async {
                            String jenis =
                                DataConverter.convertJenis(dropdownValue);
                            String bulan =
                                DataConverter.convertBulan(dropdownValue2);
                            String tahun =
                                DataConverter.convertTahun(selectedYear);
                            await ApiServiceHistori()
                                .downloadAndOpenPDF(jenis, bulan, tahun);
                          },
                          child: mediumWhiteText("Unduh Laporan"),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: currentPage > 0 ? previousPage : null,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(220, 106, 0, 0.5),
                        ),
                      ),
                      regularBlackText2("Page ${currentPage + 1}"),
                      IconButton(
                        onPressed:
                            endIndex < historiList.length ? nextPage : null,
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(220, 106, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<List<Histori>> getHistoriData() async {
    final apiService = ApiServiceHistori();
    String jenis = DataConverter.convertJenis(dropdownValue);
    String bulan = DataConverter.convertBulan(dropdownValue2);
    String tahun = DataConverter.convertTahun(selectedYear);

    try {
      final historiList = await apiService.getHistori(jenis, bulan, tahun);
      return historiList;
    } catch (e) {
      throw Exception("Failed to fetch 'Ambil' histori data: $e");
    }
  }
}
