import 'package:http/http.dart' as http;
import '../Models/user_models.dart';

class ApiServiceUser {
  final String baseUrl = "http://10.10.99.101:3000/api";
  final http.Client client = http.Client();

  Future<List<User>> getUser() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/user"));
      if (response.statusCode == 200) {
        return FetchUser(response.body);
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      throw Exception("Failed to connect to API: $e");
    }
  }
}

