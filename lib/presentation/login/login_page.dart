import 'package:chill_map/presentation/my/my_page.dart';
import 'package:chill_map/presentation/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(body: Consumer<LoginModel>(
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
              height: 50.0,
            ),
            RaisedButton(
                child: Text('ログイン'),
                onPressed: () async {
                  try {
                    await model.login();
                    _showDialog(context, 'ログインしました');
                    //TODO:マイページに遷移
                  } catch (e) {
                    _showDialog(context, e.toString());
                  }
                }),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              child: Text('新規登録する'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50.0,
            ),
            SignInButton(
              Buttons.Google,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () async {
                try {
                  await model.googleLogin();
                  _showDialog(context, 'ログインしました');
                  //todo:マイページ遷移
                } catch (e) {
                  _showDialog(context, e.toString());
                }
              },
            )
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
                    ));
              },
            ),
          ],
        );
      },
    );
  }
}
