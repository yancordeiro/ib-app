//conceito mvc

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticia24h/controllers/home_page_controller.dart';
import 'package:noticia24h/pages/home_page_view.dart';
import 'package:noticia24h/repositories/article_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late IArticleRepository articleRepository = ArticleRepositoryMemory();
  late IArticleRepository articleRepository = ArticleRepositoryApi();
  late HomePageController controller = HomePageController(articleRepository);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        List<Tab> tabs = controller.categorias
            .map((categoria) => Tab(child: Text(categoria)))
            .toList();
        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 100,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SvgPicture.asset('assets/ibahia.svg'),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: TabBar(
                      indicatorColor: Colors.white,
                      isScrollable: true,
                      tabs: tabs,
                      onTap: (categoryIndex) =>
                          controller.loadCategory(categoryIndex))),
            ),
            body: _body(context),
          ),
        );
      },
    );
  }

  Widget _body(BuildContext context) {
    if (controller.hasArticles) {
      return HomePageView.fromArticles(controller.articles);
    } else if (controller.errorMessage.isNotEmpty) {
      return Text(controller.errorMessage);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
