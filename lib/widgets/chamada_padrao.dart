import 'package:flutter/material.dart';
import '../models/article_model.dart';

class ChamadaPadrao extends StatelessWidget {
  final List<Article> articles;

  const ChamadaPadrao({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        itemCount: articles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Article article = articles[index];
          return Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 160,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(article.urlToImage),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.author,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            height: 2,
                            letterSpacing: 0.16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        article.title,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            height: 1.5,
                            letterSpacing: 0.12,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
