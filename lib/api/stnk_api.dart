import 'package:vbbm/Models/stnk_models.dart';
import 'package:http/http.dart' as http;

class ApiServiceSTNK {
  final String baseUrl = "http://10.10.99.101:3000/api";
  final http.Client client = http.Client();

  Future<List<STNK>> getSTNK() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/stnk"));
      if (response.statusCode == 200) {
        return FetchSTNK(response.body);
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }

  Future<void> getDayleft() async {
    try {
      await client.get(Uri.parse("$baseUrl/dayleft"));
    } catch (e) {
      print("Error fetching Dayleft data: $e");
    }
  }

  Future<void> addYear(int id) async {
    try {
      await client.patch(Uri.parse("$baseUrl/addyear/$id"));
    } catch (e) {
      print("Error Update Year data: $e");
    }
  }


  Future<http.Response> createSTNK(STNK data) async {
    try {
      final response = await client.post(
        Uri.parse("$baseUrl/stnk"),
        headers: {"content-type": "application/json"},
        body: STNKToJson(data),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to create data: $e");
    }
  }

  Future<http.Response> updateSTNK(STNK data) async {
    try {
      final response = await client.patch(
        Uri.parse("$baseUrl/stnk/${data.id}"),
        headers: {"content-type": "application/json"},
        body: UpdateSTNKToJson(data),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to update data: $e");
    }
  }

  Future<http.Response> deleteSTNK(int id) async {
    try {
      final response = await client.delete(
        Uri.parse("$baseUrl/stnk/$id"),
        headers: {"content-type": "application/json"},
      );
      return response;
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
}
