import 'package:flutter/material.dart';

///
/// Renders a flexible image header
///

class GeoHeroHeader extends StatelessWidget {
  final String title;
  final String imageName;

  const GeoHeroHeader({Key key, @required this.title, @required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: imageName,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(imageName),
          ),
        ),
        Positioned(
          top: 16.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
