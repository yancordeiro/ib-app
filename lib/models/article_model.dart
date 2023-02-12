// ignore_for_file: public_member_api_docs, sort_constructors_first

class Article {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  const Article({
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "",
      author: json['author'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
    );
  }

  get article => null;
}
