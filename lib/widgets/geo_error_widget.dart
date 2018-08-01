import 'package:flutter/material.dart';

import '../models/geo_layout.dart';

///
/// Renders an error message with a retry option.
///
/// Retry will invoke the assigned `action` [Function].
///

class GeoError extends StatelessWidget {
  final Function action;

  const GeoError({@required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Failed to load locations",
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.all(standardPadding),
          child: RaisedButton(
            child: Text('retry'),
            onPressed: () {
              action();
            },
          ),
        ),
      ],
    );
  }
}
