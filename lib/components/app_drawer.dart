import 'package:flutter/material.dart';
import 'package:lisa/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
              icon: Icons.help_outline,
              text: 'Unknown Words',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.wordsUnknown)),
          _createDrawerItem(
            icon: Icons.highlight_off,
            text: 'Learning Words',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.wordsLearning),
          ),
          _createDrawerItem(
            icon: Icons.check_circle_outline,
            text: 'Learned Words',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.wordsLearned),
          ),
          _createDrawerItem(
            icon: Icons.library_books,
            text: 'Articles',
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.articles),
          ),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('Menu',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
