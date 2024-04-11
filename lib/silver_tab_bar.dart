import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SilverTabBarState();
}

class _SilverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      'https://upload.wikimedia.org/wikipedia/commons/c/cf/Mexican_Wolf_-_Lobo_Mexicano.jpg';
  List<String> miImages = [
    'https://upload.wikimedia.org/wikipedia/commons/c/cf/Mexican_Wolf_-_Lobo_Mexicano.jpg',
    'https://files.worldwildlife.org/wwfcmsprod/images/HERO_Bengal_Tiger_Creek_Bank_India/hero_small/1ah4py338k_Medium_WW226367.jpg',
    'https://i.natgeofe.com/n/e3ae5fbf-ddc9-4b18-8c75-81d2daf962c1/3948225.jpg',
    'https://static.nationalgeographic.es/files/styles/image_3200/public/01-lion-populations-nationalgeographic_1777804.jpg?w=1900&h=1267',
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Colors.deepPurple,
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Naturaleza Extraordinaria"),
            background: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Colors.deepPurple,
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController!,
              indicatorColor: Colors.greenAccent,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white),
              isScrollable: true,
              tabs: const [
                Tab(text: 'Lobos'),
                Tab(text: 'Tigres'),
                Tab(text: 'Guacamayas'),
                Tab(text: 'Leones'),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: TabBarView(controller: tabController, children: const [
                Text("Hola 1"),
                Text("Hola 2"),
                Text("Hola 3"),
                Text("Hola 4"),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
