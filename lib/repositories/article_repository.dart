import 'package:noticia24h/api/get_article.dart';

import '../models/article_model.dart';

abstract class IArticleRepository {
  Future<List<Article>> getArticles();
}

class ArticleRepositoryApi extends IArticleRepository {
  @override
  Future<List<Article>> getArticles() {
    return getArticle();
  }
}

class ArticleRepositoryMemory extends IArticleRepository {
  @override
  Future<List<Article>> getArticles() async {
    return [
      Article.fromJson({
        "author": null,
        "title":
            "Grupo invade concessionária e rouba 12 carros em Fortaleza; vídeo - Globo",
        "description":
            "O advogado do estabelecimento informou que, dos veículos roubados, seis foram recuperados até as 21h desta segunda-feira.",
        "url":
            "https://g1.globo.com/ce/ceara/noticia/2023/02/13/grupo-invade-concessionaria-e-rouba-12-carros-em-fortaleza-video.ghtml",
        "urlToImage":
            "https://s2.glbimg.com/nItgIvAT4aAp0SkeaZODoUdO4KE=/1200x/smart/filters:cover():strip_icc()/s01.video.glbimg.com/x720/11365868.jpg",
        "publishedAt": "2023-02-14T00:09:00Z",
        "content":
            "O advogado do estabelecimento informou que, ao todo, os veículos devem somar cerca de 1 milhão de reais. Dos veículos roubados, seis já foram recuperados até as 21h desta segunda-feira, segundo o … [+1358 chars]"
      }),
    ];
  }
}
