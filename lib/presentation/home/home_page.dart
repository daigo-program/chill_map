import 'package:chill_map/presentation/login/login_page.dart';
import 'package:chill_map/presentation/map/map_page.dart';
import 'package:chill_map/presentation/timeline/time_line_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tab = <Tab>[
      Tab(text: 'Home', icon: Icon(Icons.home)),
      Tab(text: 'Search', icon: Icon(Icons.search)),
      Tab(text: 'MyPage', icon: Icon(Icons.person_rounded)),
    ];

    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => HomePageModel(),
      child: Consumer<HomePageModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: _tab.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Chill Log'),
                bottom: TabBar(
                  tabs: _tab,
                ),
              ),
              body: TabBarView(children: <Widget>[
                TimeLinePage(),
                MapPage(),
                LoginPage(),
              ]),
            ),
          );
        },
      ),
    );
  }
}
