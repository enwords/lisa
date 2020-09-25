import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/routes.dart';
import 'package:lisa/screens/article/add_screen.dart';
import 'package:lisa/screens/article/list_screen.dart';
import 'package:lisa/screens/home_screen.dart';
import 'package:lisa/screens/word_list_screen.dart';

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
        Routes.wordsUnknown: (context) =>
            WordListScreen(title: 'Unknown Words', status: 'unknown'),
        Routes.wordsLearning: (context) =>
            WordListScreen(title: 'Learning Words', status: 'learning'),
        Routes.wordsLearned: (context) =>
            WordListScreen(title: 'Learned Words', status: 'learned'),
        Routes.articles: (context) => ArticleListScreen(),
        Routes.articlesAdd: (context) => ArticleAddScreen(),
      },
    );
  }
}
