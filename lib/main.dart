import 'package:lisa/screens/words_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main({String env = 'dev'}) async {
  await DotEnv().load('.env.$env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enwords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WordsScreen(title: 'Unknown Words', status: 'unknown'),
    );
  }
}
