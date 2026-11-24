import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'http://localhost:8888/api-test/public';

  Future<List<dynamic>> getFamilleMembres() async {
    final response = await http.get(
      Uri.parse('$baseUrl/famille-membres'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception('Erreur lors du chargement des membres');
    }
  }
}