import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/routes.dart';
import 'package:lisa/screens/home_screen.dart';
import 'package:lisa/screens/words_screen.dart';

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
      home: HomeScreen(),
      routes: {
        Routes.home: (context) => HomeScreen(),
        Routes.unknownWords: (context) =>
            WordsScreen(title: 'Unknown Words', status: 'unknown'),
        Routes.learningWords: (context) =>
            WordsScreen(title: 'Learning Words', status: 'learning'),
        Routes.learnedWords: (context) =>
            WordsScreen(title: 'Learned Words', status: 'learned'),
      },
    );
  }
}
