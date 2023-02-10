import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

const url =
    "https://newsapi.org/v2/top-headlines?country=br&apiKey=399c0c22d7c845608909937a974ab209";

Future<List<Article>> getArticle() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    List<Article> articles =
        data.map((json) => Article.fromJson(json)).toList();
    return articles;
  } else {
    throw Exception("Failed to get articles");
  }
}
