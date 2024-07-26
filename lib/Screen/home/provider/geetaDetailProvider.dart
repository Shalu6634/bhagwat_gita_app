import 'package:flutter/material.dart';

class GeetaDetailProvider extends ChangeNotifier {
  String selectedLanguage = 'Sanskrit';

  void LanguageTranslator(String value) {
    selectedLanguage = value;
    notifyListeners();
  }
}
