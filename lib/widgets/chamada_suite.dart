import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/article_model.dart';

class ChamadaSuite extends StatelessWidget {
  final Article article;
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  const ChamadaSuite(
      {super.key,
      required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content,
      required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/vasco.png")),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ESPORTE",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      letterSpacing: 0.13,
                    ),
                  ),
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                      letterSpacing: 0.16,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
