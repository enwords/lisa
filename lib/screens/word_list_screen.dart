import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lisa/components/app_drawer.dart';
import 'package:lisa/services/word/get_list.dart';
import 'package:lisa/models/word.dart';

class WordListScreen extends StatefulWidget {
  WordListScreen({Key key, this.title, this.status}) : super(key: key);

  final String title;
  final String status;

  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  final List<Word> _words = <Word>[];
  final Set<Word> _selectedWords = <Word>{};
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
    var wordsJson = await WordGetList().call(widget.status, page);
    var wordsMap = json.decode(wordsJson);
    return Words.fromJson(wordsMap).collection;
  }

  @override
  void initState() {
    super.initState();

    _getWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemCount: _words.length, itemBuilder: _buildWordList));
  }

  Widget _buildWordList(BuildContext context, int index) {
    if (index >= _words.length - 1) {
      _getWords();
    }
    return _buildWordCard(_words[index]);
  }

  Card _buildWordCard(Word word) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: _selectedWords.contains(word),
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          _selectedWords.add(word);
                        } else {
                          _selectedWords.remove(word);
                        }
                      });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(word.value,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(word.transcription ?? '',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600)),
                  ],
                )
              ],
            )));
  }
}
