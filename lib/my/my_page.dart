import 'package:chill_map/my/my_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyPageModel>(
      create: (_) => MyPageModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('マイページ'),
          backgroundColor: Colors.teal,
        ),
        body: Consumer<MyPageModel>(builder: (context, model, child) {
          return Center(
            child: Text('マイページ'),
          );
        }),
      ),
    );
  }
}
