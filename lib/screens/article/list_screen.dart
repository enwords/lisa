import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lisa/components/app_drawer.dart';
import 'package:lisa/screens/article/add_screen.dart';
import 'package:lisa/screens/article/item_screen.dart';
import 'package:lisa/services/article/get_list.dart';
import 'package:lisa/models/article.dart';

class ArticleListScreen extends StatefulWidget {
  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final List<Article> _articles = <Article>[];
  final Set<Article> _selectedArticles = <Article>{};
  final int _maxTitleLength = 40;
  int _pageNum = 1;
  bool _isLastPage = false;

  void _getArticles() {
    if (!_isLastPage) {
      _fetchArticleList(_pageNum).then((value) {
        setState(() {
          if (value.isEmpty) {
            _isLastPage = true;
          } else {
            _articles.addAll(value);
            _pageNum = _pageNum + 1;
          }
        });
      });
    }
  }

  Future<List<Article>> _fetchArticleList(int page) async {
    var articlesJson = await ArticleGetList().call(page);
    var articlesMap = json.decode(articlesJson);
    return Articles.fromJson(articlesMap).collection;
  }

  @override
  void initState() {
    super.initState();

    _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Articles'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemCount: _articles.length, itemBuilder: _buildArticleList),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ArticleAddScreen()));
          },
          child: Icon(Icons.add),
        ));
  }

  Widget _buildArticleList(BuildContext context, int index) {
    if (index >= _articles.length - 1) {
      _getArticles();
    }
    return _buildArticleCard(_articles[index]);
  }

  Card _buildArticleCard(Article article) {
    var title = article.title;
    if (title.length > _maxTitleLength) {
      title = title.substring(0, _maxTitleLength - 3) + '...';
    }

    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: _selectedArticles.contains(article),
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          _selectedArticles.add(article);
                        } else {
                          _selectedArticles.remove(article);
                        }
                      });
                    }),
                GestureDetector(
                  onTap: () => _pushArticle(article),
                  child: Text(title),
                )
              ],
            )));
  }

  _pushArticle(Article article) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ArticleItemScreen(article)));
  }
}
