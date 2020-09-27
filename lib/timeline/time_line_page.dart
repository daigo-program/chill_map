import 'package:chill_map/add_post/add_post_page.dart';
import 'package:chill_map/domain/post.dart';
import 'package:chill_map/timeline/time_line_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimeLineModel>(
      create: (_) => TimeLineModel()..fetchPosts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.teal,
        ),
        body: Consumer<TimeLineModel>(builder: (context, model, child) {
          final posts = model.posts;
          final listTiles = posts
              .map((post) => ListTile(
                    title: Text(post.sentence),
                    trailing: Wrap(children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPostPage(
                                        post: post,
                                      ),
                                  fullscreenDialog: true));
                          model..fetchPosts();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('削除しますか？'),
                                actions: <Widget>[
                                  FlatButton(
                                    color: Colors.red,
                                    shape: StadiumBorder(),
                                    child: Text('削除する'),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      await deletePost(context, model, post);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ]),
                  ))
              .toList();
          return ListView(
            children: listTiles,
          );
        }),
        floatingActionButton:
            Consumer<TimeLineModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddPostPage(),
                      fullscreenDialog: true));
              model..fetchPosts();
            },
          );
        }),
      ),
    );
  }

  Future deletePost(
      BuildContext context, TimeLineModel model, Post post) async {
    try {
      await model.deletePost(post);
      await model.fetchPosts();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text((e).toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
