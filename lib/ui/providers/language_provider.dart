import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String selectedLanguage ="en";
set newLanguage(String language){
  selectedLanguage = language;
  notifyListeners();
}
}