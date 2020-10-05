import 'package:chill_map/presentation/home/web_home_page.dart';
import 'package:chill_map/presentation/map/map_page.dart';
import 'package:flutter/material.dart';
import 'presentation/home/home_page.dart';
import 'package:firebase/firebase.dart';

void main() {
  runApp(ChillLog());
}

class ChillLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chill Log',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.grey,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: HomePage(),
    );
  }
}
