import 'package:chill_map/add_post/add_post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPostModel>(
      create: (_) => AddPostModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('新しい投稿'),
          ),
          body: Consumer<AddPostModel>(
            builder: (context, model, child) {
              return Column(children: [
                TextField(
                  onChanged: (text) {
                    model.postSentence = text;
                  },
                ),
                RaisedButton(
                  child: Text('投稿'),
                  onPressed: () async {
                    //todoFireStoreにPostを追加
                    try {
                      await model.addPostToFireBase();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('保存しました'),
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
                      Navigator.of(context).pop();
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
                  },
                ),
              ]);
            },
          )),
    );
  }
}
