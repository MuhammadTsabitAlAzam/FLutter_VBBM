import 'dart:convert';

class Voucher {
  int id;
  String nama;
  String bagian;
  String tanggal_pengambilan;
  String? tanggal_pengembalian;
  int dualima;
  int limapuluh;
  int seratus;

  Voucher({
    this.id =0,
    required this.nama,
    required this.bagian,
    required this.tanggal_pengambilan,
    this.tanggal_pengembalian,
    required this.dualima,
    required this.limapuluh,
    required this.seratus});

  factory Voucher.fromJson(Map<String, dynamic> map) {
    return Voucher(
        id: map["id"],
        nama: map["nama"],
        bagian: map["bagian"],
        tanggal_pengambilan: map["tanggal_pengambilan"],
        tanggal_pengembalian: map["tanggal_pengembalian"],
        dualima: map["dualima"],
        limapuluh: map["limapuluh"],
        seratus: map["seratus"]);
  }

  Map<String, dynamic> toJson() {
    return {"nama": nama, "bagian": bagian, "tanggal_pengambilan": tanggal_pengambilan, "dualima": dualima, "limapuluh": limapuluh, "seratus": seratus};
  }

  Map<String, dynamic> UpdatetoJson() {
    return {"tanggal_pengembalian": tanggal_pengembalian};
  }

  @override
  String toString() {
    return 'Voucher{id: $id, nama: $nama, bagian: $bagian, tanggal_pengambilan : $tanggal_pengambilan, tanggal_pengembalian: $tanggal_pengembalian, dualima: $dualima, limapuluh: $limapuluh, seratus: $seratus}';
  }

}

List<Voucher> FetchVoucher(String jsonData) {
  final Map<String, dynamic> data = json.decode(jsonData);
  final List<dynamic> vouchersData = data['data'];
  return List<Voucher>.from(vouchersData.map((item) => Voucher.fromJson(item)));
}

String voucherToJson(Voucher data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

String UpdatevoucherToJson(Voucher data) {
  final jsonData = data.UpdatetoJson();
  return json.encode(jsonData);
}