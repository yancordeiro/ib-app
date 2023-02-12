import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

const url =
    "https://newsapi.org/v2/top-headlines?country=br&apiKey=399c0c22d7c845608909937a974ab209";

void main() {
  getArticle();
}

Future<List<Article>> getArticle() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    List<Article> articles =
        List<Article>.from(data["articles"].map((e) => Article.fromJson(e)));
    return articles;
  } else {
    throw Exception("Failed to get articles");
  }
}
