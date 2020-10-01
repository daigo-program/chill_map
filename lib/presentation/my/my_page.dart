import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_model.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyPageModel>(
      create: (_) => MyPageModel(),
      child: Scaffold(
        body: Consumer<MyPageModel>(builder: (context, model, child) {
          return Center(
            child: Text('マイページ'),
          );
        }),
      ),
    );
  }
}
