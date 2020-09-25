import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String daigoText = 'Daigo';

  void changeText() {
    daigoText = 'だいごかっこいい';
    notifyListeners();
  }
}
