import 'package:flutter/widgets.dart';
import 'package:noticia24h/repositories/article_repository.dart';
import '../models/article_model.dart';

class HomePageController extends ChangeNotifier {
  List<Article> articles = [];

  List<String> categorias = [];

  String errorMessage = "";

  final IArticleRepository articleRepository;

  HomePageController(this.articleRepository) {
    _fetchCategorias();
    _fetchArticles();
  }

  bool get hasArticles => articles.isNotEmpty;

  void _setArticles(List<Article> articles) {
    this.articles = articles;
  }

  void _fetchCategorias() async {
    categorias = [
      'últimas notícias',
      'bahia',
      'política',
      'esportes',
      'últimas notícias',
      'agenda cultural',
    ];
    notifyListeners();
  }

  void _fetchArticles() async {
    try {
      List<Article> articles = await articleRepository.getArticles();
      _setArticles(articles);
      errorMessage = "";
      notifyListeners();
    } catch (e) {
      articles = [];
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  loadCategory(int categoryIndex) {
    //chamar a api com o parametro da category informada
  }
}
