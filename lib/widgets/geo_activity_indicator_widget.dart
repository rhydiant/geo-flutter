import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Renders an activity (platform specific) indicator
///

class GeoActivityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Platform.isIOS)
          ? const CupertinoActivityIndicator(
              radius: 10.0,
            )
          : const CircularProgressIndicator(),
    );
  }
}
