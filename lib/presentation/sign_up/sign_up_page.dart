import 'package:chill_map/presentation/my/my_page.dart';
import 'package:chill_map/presentation/sign_up/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('新規登録'),
          ),
          body: Consumer<SignUpModel>(
            builder: (context, model, child) {
              return Column(children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'example@chill.com',
                  ),
                  controller: mailController,
                  onChanged: (text) {
                    model.mail = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                  obscureText: true,
                  controller: passwordController,
                  onChanged: (text) {
                    model.password = text;
                  },
                ),
                SizedBox(
                  height: 100.0,
                ),
                RaisedButton(
                    child: Text('登録する'),
                    onPressed: () async {
                      try {
                        await model.signUp();
                        _showDialog(context, '登録しました');
                        //TODO:Home画面に遷移

                      } catch (e) {
                        _showDialog(context, e.toString());
                      }
                    }),
                SizedBox(
                  height: 100.0,
                ),
              ]);
            },
          )),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPage(),
                        fullscreenDialog: true));
              },
            ),
          ],
        );
      },
    );
  }
}
