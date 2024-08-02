import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/quotesModel.dart';

class QuotesApi {

  Future<Map<String, String>> getRandom() async {
    final url = Uri.parse('https://api.quotable.io/random');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return {
        'content': jsonData['content'] ?? '',
        'authorSlug': jsonData['authorSlug'] ?? '',
      };
    } else {
      throw Exception('Failed to load data');
    }
  }

}
