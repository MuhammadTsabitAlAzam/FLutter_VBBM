import 'package:vbbm/Models/histori_models.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ApiServiceHistori {
  final String baseUrl = "http://10.10.99.101:3000/api";
  final http.Client client = http.Client();

  Future<List<Histori>> getHistori(String jenis, String bulan, String tahun) async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/histori?jenis=$jenis&bulan=$bulan&tahun=$tahun"));
      if (response.statusCode == 200) {
        return FetchHistori(response.body);
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }

  Future<http.Response> createHistori(Histori data) async {
    try {
      final response = await client.post(
        Uri.parse("$baseUrl/histori"),
        headers: {"content-type": "application/json"},
        body: HistoriToJson(data),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to create data: $e");
    }
  }

  Future<http.Response> updateHistori(Histori data) async {
    try {
      final response = await client.patch(
        Uri.parse("$baseUrl/histori/${data.id}"),
        headers: {"content-type": "application/json"},
        body: UpdateHistoriToJson(data),
      );
      return response;
    } catch (e) {
      throw Exception("Failed to update data: $e");
    }
  }

  Future<http.Response> deleteHistori(int id) async {
    try {
      final response = await client.delete(
        Uri.parse("$baseUrl/histori/$id"),
        headers: {"content-type": "application/json"},
      );
      return response;
    } catch (e) {
      throw Exception("Failed to delete data: $e");
    }
  }
  Future<void> downloadAndOpenPDF(String jenis, String bulan, String tahun) async {
    final url = 'https://backendvbbm-2ilatku7iq-et.a.run.app/api/download?jenis=$jenis&bulan=$bulan&tahun=$tahun';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final tempFilePath = await createTempFile(bytes);

      final result = await OpenFile.open(tempFilePath);

      if (result.type == ResultType.done) {
        print('File opened successfully');
      }
    } else {
      print('Failed to download PDF: ${response.statusCode}');
    }
  }

  Future<String> createTempFile(List<int> bytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/downloaded_file.pdf';

    final tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(bytes);

    return tempFilePath;
  }

}

