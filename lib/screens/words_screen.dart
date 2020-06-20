import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lisa/services/words/get_list.dart';
import 'package:lisa/models/word.dart';

class WordsScreen extends StatefulWidget {
  WordsScreen({Key key, this.title, this.status}) : super(key: key);
  final String title;
  final String status;

  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  final List<Word> _words = <Word>[];
  int _pageNum = 1;
  bool _isLastPage = false;

  void _getWords() {
    if (!_isLastPage) {
      _fetchWordList(_pageNum).then((value) {
        setState(() {
          if (value.isEmpty) {
            _isLastPage = true;
          } else {
            _words.addAll(value);
            _pageNum = _pageNum + 1;
          }
        });
      });
    }
  }

  Future<List<Word>> _fetchWordList(int page) async {
    var wordsJson = await WordsGetList().call(widget.status, page);
    var wordsMap = json.decode(wordsJson);
    return Words.fromJson(wordsMap).collection;
  }

  @override
  void initState() {
    _getWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: _words.length, itemBuilder: _buildList));
  }

  Widget _buildList(BuildContext context, int index) {
    if (index >= _words.length - 1) {
      _getWords();
    } else {
      return Card(
          child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_words[index].value,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(_words[index].transcription ?? '',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600)),
                ],
              )));
    }
  }
}
