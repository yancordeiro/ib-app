import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noticia24h/widgets/manchete_suite_destaque.dart';

class HomePage extends StatelessWidget {
  List<Tab> tabs = [
    const Tab(child: Text('últimas notícias')),
    const Tab(child: Text('bahia')),
    const Tab(child: Text('política')),
    const Tab(child: Text('esportes')),
    const Tab(child: Text('últimas notícias')),
    const Tab(child: Text('agenda cultural')),
  ];

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
        body: Column(
          children: [
            const MancheteSuiteDestaque(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
