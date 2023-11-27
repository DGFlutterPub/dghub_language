import 'package:flutter/material.dart';
import 'package:dghub_language/dghub_language.dart';

import 'language/en.dart';

void main() async {
  await DGHubLanguage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DGHubLanguage(
      defaultLanguage: en,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.language('title'),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blue)),
                onPressed: () {
                  if (context.languageCurrentCode() == 'en') {
                    context.languageChange(DGHubLanguageModel(
                        id: '0',
                        name: 'Burmese',
                        code: 'mm',
                        data: {'title': 'Burmese title'}));
                  } else {
                    context.languageChange(en);
                  }
                },
                child: Text('Change'))
          ],
        ),
      ),
    );
  }
}
