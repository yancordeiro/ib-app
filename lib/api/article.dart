import 'dart:convert';

import 'package:http/http.dart' as http;

const url =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=399c0c22d7c845608909937a974ab209";

void main() {
  getArticle();
}

Future<void> getArticle() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var articles = jsonDecode(response.body);
    print(articles);
  } else {
    throw Exception("Failed to get articles");
  }
}
