import 'package:chill_map/presentation/home/web_home_page.dart';
import 'package:flutter/material.dart';
import 'presentation/home/home_page.dart';

void main() => runApp(ChillMap());

class ChillMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chill Map',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: AppHomePage(),
    );
  }
}
