import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

///
/// Renders a star (bullet) rating out of 5
///

class GeoRating extends StatelessWidget {
  final int score;

  const GeoRating({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _Circle(active: score > 0),
        _Circle(active: score > 1),
        _Circle(active: score > 2),
        _Circle(active: score > 3),
        _Circle(active: score > 4),
        Container(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            '$score.0/5.0',
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w400,
              color: GeoColors.darkGrey,
            ),
          ),
        ),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  final double size = 10.0;
  final bool active;

  const _Circle({Key key, @required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: active
          ? const Key('GeoRating._Circle.Active.Key')
          : const Key('GeoRating._Circle.Inactive.Key'),
      margin: const EdgeInsets.all(3.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: active ? GeoColors.primary : GeoColors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
