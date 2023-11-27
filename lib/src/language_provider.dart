import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'dghub_language_model.dart';

class DGHubLanguageProvider extends ChangeNotifier {
  DGHubLanguageProvider(Map<String, String> data) {
    init(data);
  }

  Map<String, String> getData = {};
  var box = Hive.box('language');

  get(String key) {
    try {
      return getData[key] ?? 'null';
    } catch (e) {
      return 'null';
    }
  }

  init(Map<String, String> data) async {
    getData.addAll(data);

    if (box.get('language') == null) {
      box.put('language', 'en');
      box.put('en', jsonEncode(getData));
    }
    read();
  }

  change(DGHubLanguageModel model) {
    box.put('language', model.code);
    box.put(model.code, jsonEncode(model.data));
    read();
  }

  read() {
    var lg = box.get('language') ?? 'en';
    if (kDebugMode) {
      print(lg);
    }
    var result = jsonDecode(box.get(lg) ?? '{}');
    Map<String, String> strMap = <String, String>{};
    result.forEach((key, value) => strMap[key] = value.toString());
    if (kDebugMode) {
      print(strMap);
    }
    getData = strMap;
    notifyListeners();
  }
}
