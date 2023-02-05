import 'dart:convert';

import 'package:http/http.dart' as http;

const url = "https://ibahia.mundiware.com/hub/article";

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
