import 'package:chill_map/add_post/add_post_model.dart';
import 'package:chill_map/domain/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPostPage extends StatelessWidget {
  AddPostPage({this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    final bool isUpdate = post != null;
    final textEditingController = TextEditingController();

    if (isUpdate) {
      textEditingController.text = post.sentence;
    }

    return ChangeNotifierProvider<AddPostModel>(
      create: (_) => AddPostModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(isUpdate ? '編集する' : '新しい投稿'),
          ),
          body: Consumer<AddPostModel>(
            builder: (context, model, child) {
              return Column(children: [
                TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    model.postSentence = text;
                  },
                ),
                RaisedButton(
                  child: Text(isUpdate ? '更新' : '投稿する'),
                  onPressed: () async {
                    if (isUpdate) {
                      await updatePost(model, context);
                    } else {
                      await addPost(model, context);
                    }
                    //todoFireStoreにPostを追加
                  },
                ),
              ]);
            },
          )),
    );
  }

  Future addPost(AddPostModel model, BuildContext context) async {
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
  }

  Future updatePost(AddPostModel model, BuildContext context) async {
    try {
      await model.updatePost(post);
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('更新しました'),
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
  }
}
