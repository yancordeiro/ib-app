import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../widgets/chamada_padrao.dart';
import '../widgets/chamada_suite.dart';
import '../widgets/manchete_suite_destaque.dart';
import 'home_page_view_model.dart';

class HomePageView extends StatelessWidget {
  final HomePageViewModel viewModel;
  const HomePageView({
    super.key,
    required this.viewModel,
  });

  factory HomePageView.fromArticles(List<Article> articles) {
    return HomePageView(viewModel: HomePageViewModel.fromArticles(articles));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      if (viewModel.manchete != null)
        MancheteSuiteDestaque.fromArticle(viewModel.manchete!),
      ...viewModel.suite1.map((article) => ChamadaSuite.fromArticle(article)),
      ChamadaPadrao(
        articles: viewModel.padrao1,
      ),
      ...viewModel.suite2.map((article) => ChamadaSuite.fromArticle(article)),
      ChamadaPadrao(
        articles: viewModel.padrao2,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
