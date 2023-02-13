//conceito mvc

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticia24h/controllers/home_page_controller.dart';
import 'package:noticia24h/widgets/chamada_padrao.dart';
import '../models/article_model.dart';
import '../widgets/manchete_suite_destaque.dart';
import '../widgets/chamada_suite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = HomePageController();

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
    if (controller.articles.isNotEmpty) {
      return ListView.builder(
        itemCount: controller.articles.length,
        itemBuilder: (context, index) {
          Article article = controller.articles[index];
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index == 0)
                  MancheteSuiteDestaque.fromArticle(article), // 1 artigo
                if (index == 0)
                  ChamadaSuite.fromArticle(
                      article), // loop com 3 artigos (excluindo o anterior)
                if (index == 0)
                  ChamadaPadrao.fromArticle(
                      article), // 1 widget com as 6 artigos (excluindo os anteriores)
                if (index == 0)
                  ChamadaSuite.fromArticle(
                      article), // loop com 3 artigos (excluindo o anterior)
              ],
            ),
          );
        },
      );
    } else if (controller.errorMessage.isNotEmpty) {
      return Text(controller.errorMessage);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
