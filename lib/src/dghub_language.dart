import 'package:dghub_language/src/dghub_language_model.dart';
import 'package:dghub_language/src/language_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class DGHubLanguage extends StatelessWidget {
  final Widget child;
  final DGHubLanguageModel defaultLanguage;
  const DGHubLanguage(
      {required this.defaultLanguage, required this.child, super.key});

  static init() async {
    if (!kIsWeb) {
      var dr = await getApplicationSupportDirectory();
      Hive.init(dr.path);
    }

    await Hive.openBox('language');
    // Hive.deleteBoxFromDisk('language');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (c) => DGHubLanguageProvider(defaultLanguage.data ?? {})),
      ],
      child: Consumer<DGHubLanguageProvider>(builder: (_, state, __) {
        return child;
      }),
    );
  }
}
