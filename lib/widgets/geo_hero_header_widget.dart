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
      children: <Widget>[
        Hero(
          tag: imageName,
          child: Image(
            image: AssetImage(imageName),
          ),
        ),
        _GeoGradient(),
        Positioned(
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

///
/// Renders a simple gradient for [GeoHeroHeader]s
///

class _GeoGradient extends StatelessWidget {
  const _GeoGradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white,
          ],
          stops: [0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
