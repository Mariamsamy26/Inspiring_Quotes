import 'dart:convert';
import 'package:http/http.dart' as https;

class QuotesApi {

  Future<Map<String, String>> getRandom() async {
    final url = Uri.parse('https://api.quotable.io/quotes/random');
    final response = await https.get(url);

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
