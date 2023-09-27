import 'dart:convert';

class Histori {
  int id;
  String nama;
  String bagian;
  String tanggal;
  int dualima;
  int limapuluh;
  int seratus;
  String jenis;
  int? jumlah;

  Histori({
    this.id =0,
    required this.nama,
    required this.bagian,
    required this.tanggal,
    required this.dualima,
    required this.limapuluh,
    required this.seratus,
    required this.jenis,
    this.jumlah,
  });

  factory Histori.fromJson(Map<String, dynamic> map) {
    return Histori(
        id: map["id"],
        nama: map["nama"],
        bagian: map["bagian"],
        tanggal: map["tanggal"],
        dualima: map["dualima"],
        limapuluh: map["limapuluh"],
        seratus: map["seratus"],
        jenis: map["jenis"],
        jumlah: map["jumlah"]
    );
  }

  Map<String, dynamic> toJson() {
    return {"nama": nama, "bagian": bagian, "tanggal": tanggal, "dualima": dualima, "limapuluh": limapuluh, "seratus": seratus, "jenis" : jenis};
  }

  Map<String, dynamic> UpdatetoJson() {
    return {"nama": nama, "bagian": bagian, "tanggal": tanggal, "dualima": dualima, "limapuluh": limapuluh, "seratus": seratus, "jenis" : jenis};
  }

  @override
  String toString() {
    return 'Histori{id: $id, nama: $nama, bagian: $bagian, tanggal : $tanggal, dualima: $dualima, limapuluh: $limapuluh, seratus: $seratus, jenis: $jenis}';
  }

}

List<Histori> FetchHistori(String jsonData) {
  final Map<String, dynamic> data = json.decode(jsonData);
  final List<dynamic> vouchersData = data['data'];
  return List<Histori>.from(vouchersData.map((item) => Histori.fromJson(item)));
}

String HistoriToJson(Histori data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

String UpdateHistoriToJson(Histori data) {
  final jsonData = data.UpdatetoJson();
  return json.encode(jsonData);
}