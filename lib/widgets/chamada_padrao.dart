import 'package:flutter/material.dart';
import '../models/article_model.dart';

class ChamadaPadrao extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;

  const ChamadaPadrao(
      {super.key,
      required this.title,
      required this.author,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory ChamadaPadrao.fromArticle(Article article) {
    return ChamadaPadrao(
      title: article.title,
      author: article.author,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
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
                            image: NetworkImage(urlToImage),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Colors.black.withOpacity(0.6),
                            //     Colors.black.withOpacity(0.2),
                            //   ],
                            //   stops: const [0.0, 1],
                            //   begin: Alignment.bottomCenter,
                            //   end: Alignment.topCenter,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          height: 2,
                          letterSpacing: 0.16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1.5,
                          letterSpacing: 0.12,
                          fontWeight: FontWeight.w500,
                        ),
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
