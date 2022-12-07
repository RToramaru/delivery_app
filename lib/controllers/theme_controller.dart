import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier{
  bool isDark = false;

  void changeTheme(bool value){
    isDark = value;
    notifyListeners();
  }
}