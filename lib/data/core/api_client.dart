import 'package:flutterforge/data/core/api_constants.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client client;

  ApiClient({required this.client});

  dynamic get(String path) async {
    final response = await client.get(
      Uri.parse('${ApiConstants.BASE_URL}$path'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
