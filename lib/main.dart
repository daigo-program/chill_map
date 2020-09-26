import 'package:chill_map/top/top_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChillMap());

class ChillMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chill Map',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: TopPage(),
    );
  }
}
