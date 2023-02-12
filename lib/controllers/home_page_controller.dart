import 'package:flutter/widgets.dart';
import '../api/get_article.dart';
import '../models/article_model.dart';

class HomePageController extends ChangeNotifier {
  List<Article> articles = [];
  List<String> categorias = [];

  String errorMessage = "";

  HomePageController() {
    _fetchCategorias();
    _fetchArticles();
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
      articles = await getArticle();
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
