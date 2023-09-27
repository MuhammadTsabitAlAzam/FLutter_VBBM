import 'dart:convert';

class STNK {
  int id;
  String nama_kendaraan;
  String plat_nomor;
  String tanggal;
  int? dayleft;

  STNK({
    this.id =0,
    required this.nama_kendaraan,
    required this.plat_nomor,
    required this.tanggal,
    this.dayleft
  });

  factory STNK.fromJson(Map<String, dynamic> map) {
    return STNK(
        id: map["id"],
        nama_kendaraan: map["nama_kendaraan"],
        plat_nomor: map["plat_nomor"],
        tanggal: map["tanggal"],
        dayleft: map["dayleft"]
    );
  }

  Map<String, dynamic> toJson() {
    return {"nama_kendaraan": nama_kendaraan, "plat_nomor": plat_nomor, "tanggal": tanggal};
  }


  Map<String, dynamic> UpdatetoJson() {
    return {"nama_kendaraan": nama_kendaraan, "plat_nomor": plat_nomor,"tanggal": tanggal};
  }

  @override
  String toString() {
    return 'Voucher{id: $id, nama_kendaraan: $nama_kendaraan, plat_nomor: $plat_nomor, tanggal : $tanggal, dayleft: $dayleft}';
  }

}

List<STNK> FetchSTNK(String jsonData) {
  final Map<String, dynamic> data = json.decode(jsonData);
  final List<dynamic> vouchersData = data['data'];
  return List<STNK>.from(vouchersData.map((item) => STNK.fromJson(item)));
}

String STNKToJson(STNK data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

String UpdateSTNKToJson(STNK data) {
  final jsonData = data.UpdatetoJson();
  return json.encode(jsonData);
}
