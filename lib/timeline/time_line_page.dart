import 'package:chill_map/timeline/time_line_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeLineModel>(
      create: (_) => TimeLineModel()..fetchPosts(),
      child: Scaffold(
        body: Consumer<TimeLineModel>(builder: (context, model, child) {
          final posts = model.posts;
          final listTiles = posts
              .map((post) => ListTile(title: Text(post.sentence)))
              .toList();
          return ListView(
            children: listTiles,
          );
        }),
      ),
    );
  }
}
