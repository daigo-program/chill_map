import 'package:chill_map/domain/post.dart';
import 'package:chill_map/presentation/add_post/add_post_page.dart';
import 'package:chill_map/presentation/timeline/time_line_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              .map((post) => ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
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
            child: Icon(FontAwesomeIcons.pencilAlt),
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
