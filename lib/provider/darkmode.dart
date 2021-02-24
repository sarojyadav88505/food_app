import 'package:flutter/cupertino.dart';

class DarkMode extends ChangeNotifier {
  bool _flag = false;

  void setFlag(bool value) {
    _flag = value;
    notifyListeners();
  }

  bool get flag {
    return _flag;
  }
}
