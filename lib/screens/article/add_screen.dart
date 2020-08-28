import 'package:flutter/material.dart';
import 'package:lisa/components/article/form.dart';
import 'package:lisa/routes.dart';

class ArticleAddScreen extends StatefulWidget {
  @override
  _ArticleAddScreenState createState() => _ArticleAddScreenState();
}

class _ArticleAddScreenState extends State<ArticleAddScreen> {
  _ArticleAddScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Article'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(child: ArticleForm())));
  }
}
