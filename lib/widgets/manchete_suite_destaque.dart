import 'package:flutter/material.dart';

import '../models/article_model.dart';

class MancheteSuiteDestaque extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;

  const MancheteSuiteDestaque({
    Key? key,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
  }) : super(key: key);

  factory MancheteSuiteDestaque.fromArticle(Article article) {
    return MancheteSuiteDestaque(
      title: article.title,
      author: article.author,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 446,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(urlToImage),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                ],
                stops: const [0.0, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            color: Colors.red,
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: Text(
              author,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                letterSpacing: 0.12,
                height: 1.3,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.14,
                      height: 1.2),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
