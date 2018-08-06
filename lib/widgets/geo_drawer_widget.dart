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
        padding: const EdgeInsets.only(top: 100.0),
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.person),
            ),
            title: const Text(
              'Profile',
              style: const TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.mail),
            ),
            title: const Text(
              'Messages',
              style: TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.settings),
            ),
            title: const Text(
              'Settings',
              style: const TextStyle(fontSize: 21.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.share),
            ),
            title: const Text(
              'Invite',
              style: const TextStyle(fontSize: 21.0),
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
