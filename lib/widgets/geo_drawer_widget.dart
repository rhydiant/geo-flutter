import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

///
/// Renders a material [Drawer] with app menu options
///

class GeoDrawer extends StatelessWidget {
  const GeoDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            GeoColors.gradientStart,
            GeoColors.gradientEnd,
          ],
          stops: [0.1, 0.6],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.repeated,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 100.0),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.mail),
            ),
            title: Text(
              'Messages',
              style: TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.share),
            ),
            title: Text(
              'Invite',
              style: TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ));
  }
}
