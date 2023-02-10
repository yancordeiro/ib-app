import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../api/get_article.dart';
import '../models/article_model.dart';
import '../widgets/manchete_suite_destaque.dart';
import '../widgets/chamada_suite.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tab> tabs = [
    const Tab(child: Text('últimas notícias')),
    const Tab(child: Text('bahia')),
    const Tab(child: Text('política')),
    const Tab(child: Text('esportes')),
    const Tab(child: Text('últimas notícias')),
    const Tab(child: Text('agenda cultural')),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Article>> fetchArticles() async {
    return await getArticle();
  }

  final article = const Article(
    author: '',
    content: '',
    description: '',
    title: '',
    url: '',
    urlToImage: '',
  );

  @override
  Widget build(BuildContext context) {
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
              )),
        ),
        body: FutureBuilder<List<Article>>(
          future: fetchArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Article article = snapshot.data![index];
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const MancheteSuiteDestaque(),
                          ChamadaSuite(
                            title: article.title,
                            author: article.author,
                            content: article.content,
                            description: article.description,
                            url: article.url,
                            urlToImage: article.urlToImage,
                            article: article.article,
                          ),
                        ],
                      ),
                    );
                  });
              // SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       const MancheteSuiteDestaque(),
              //       ChamadaSuite(
              //         title: article.title,
              //         author: article.author,
              //         content: article.content,
              //         description: article.description,
              //         url: article.url,
              //         urlToImage: article.urlToImage,
              //         article: article.article,
              //       ),
              //     ],
              //   ),
              // );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
