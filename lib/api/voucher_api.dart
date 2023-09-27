import 'dart:convert';
import 'package:vbbm/Models/voucher_models.dart';
import 'package:http/http.dart' as http;

class ApiServiceVoucher {
  final String baseUrl = "http://10.10.99.101:3000/api";
  final http.Client client = http.Client();

  Future<List<Voucher>> getPengambilan() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/peminjaman"));
      if (response.statusCode == 200) {
        return FetchVoucher(response.body);
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }

  Future<List<Voucher>> getPengembalian(int id) async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/voucher/$id"));
      if (response.statusCode == 200) {
        return FetchVoucher(response.body);
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }

  Future<http.Response> createPengambilan(Voucher data) async {
    try {
      final response = await client.post(
        Uri.parse("$baseUrl/voucher"),
        headers: {"content-type": "application/json"},
        body: voucherToJson(data),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to create data: $e");
    }
  }

  Future<http.Response> updateVoucher(int id, String tanggalPengembalian) async {
    try {
      final response = await client.patch(
        Uri.parse("$baseUrl/voucher/$id"),
        headers: {"content-type": "application/json"},
        body: json.encode({"tanggal_pengembalian": tanggalPengembalian}),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to update data: $e");
    }
  }

  Future<http.Response> deletePengambilan(int id) async {
    try {
      final response = await client.delete(
        Uri.parse("$baseUrl/voucher/$id"),
        headers: {"content-type": "application/json"},
      );
      return response;
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
}
