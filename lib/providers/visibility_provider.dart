import 'package:flutter/material.dart';

class TextVisibility with ChangeNotifier {
  bool isVisible = false;

  void setDisplayText(bool visibility) {
    isVisible = visibility;
    notifyListeners();
  }

  bool get getVisibility => isVisible;
}
