import 'package:flutter/material.dart';
import 'package:lisa/components/app_drawer.dart';

class HomeScreen extends StatelessWidget {
//  HomeScreen({Key key, this.title}) : super(key: key);
//
//  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enwords')),
      drawer: AppDrawer(),
      body: Center(child: Text('Hello')),
    );
  }
}
