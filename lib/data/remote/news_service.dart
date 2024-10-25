import 'dart:convert';
import 'dart:io';

import 'package:newsly/domain/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final baseUrl = 'https://dev.formandocodigo.com/articles.php?description=';

  Future<List<News>> searchNews(String query) async {
    http.Response response = await http.get(Uri.parse('$baseUrl$query'));
    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((map) => News.fromJson(map)).toList();
    }
    return [];
  }
}
