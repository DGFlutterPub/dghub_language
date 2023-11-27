import 'package:dghub_language/src/dghub_language_model.dart';
import 'package:dghub_language/src/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef M = Map<String, dynamic>;

extension Extension on BuildContext {
  String language(String key) {
    return Provider.of<DGHubLanguageProvider>(this, listen: true).get(key);
  }

  languageChange(DGHubLanguageModel m) {
    Provider.of<DGHubLanguageProvider>(this, listen: false).change(m);
  }

  languageCurrentCode() {
    return Provider.of<DGHubLanguageProvider>(this, listen: false)
        .box
        .get('language');
  }
}
