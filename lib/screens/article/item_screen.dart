import 'package:flutter/material.dart';
import 'package:lisa/models/article.dart';

class ArticleItemScreen extends StatefulWidget {
  ArticleItemScreen(this.article) {
    if (article == null) {
      throw ArgumentError("article cannot be null. Received: '$article'");
    }
  }

  final Article article;

  @override
  _ArticleItemScreenState createState() => _ArticleItemScreenState(article);
}

class _ArticleItemScreenState extends State<ArticleItemScreen> {
  final Article article;

  _ArticleItemScreenState(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: Text(article.content))));
  }
}
