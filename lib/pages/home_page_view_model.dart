import '../models/article_model.dart';

class HomePageViewModel {
  final Article? manchete;
  final List<Article> suite1;
  final List<Article> padrao1;
  final List<Article> suite2;
  final List<Article> padrao2;

  HomePageViewModel(
    this.manchete,
    this.suite1,
    this.padrao1,
    this.suite2,
    this.padrao2,
  );

  bool get hasArticles =>
      manchete != null ||
      suite1.isNotEmpty ||
      padrao1.isNotEmpty ||
      suite2.isNotEmpty ||
      padrao2.isNotEmpty;

  factory HomePageViewModel.fromArticles(List<Article> articles) {
    Article? manchete;
    List<Article> suite1 = [];
    List<Article> padrao1 = [];
    List<Article> suite2 = [];
    List<Article> padrao2 = [];
    for (Article article in articles) {
      if (manchete == null) {
        manchete = article;
      } else if (suite1.length <= 3) {
        suite1.add(article);
      } else if (padrao1.length <= 6) {
        padrao1.add(article);
      } else if (suite2.length <= 3) {
        suite2.add(article);
      } else {
        padrao2.add(article);
      }
    }
    return HomePageViewModel(manchete, suite1, padrao1, suite2, padrao2);
  }
}
