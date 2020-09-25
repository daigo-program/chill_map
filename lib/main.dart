import 'package:flutter/material.dart';

import 'map/map_page.dart';
import 'my/my_page.dart';
import 'timeline/time_line_page.dart';
import 'top/top_page.dart';

void main() => runApp(ChillMap());

class ChillMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chill Map',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/top',
        routes: <String, WidgetBuilder>{
          '/top': (BuildContext context) => TopPage(),
          '/map': (BuildContext context) => MapPage(),
          '/time': (BuildContext context) => TimeLinePage(),
          '/my': (BuildContext context) => MyPage(),
        });
  }
}
