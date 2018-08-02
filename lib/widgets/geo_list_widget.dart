import 'package:flutter/material.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/widgets/geo_list_item_widget.dart';

///
/// Renders a [ListView] of locations
///
/// Each list item is rendered using the [GeoListItem] widget
///

class GeoList extends StatefulWidget {
  final List<GeoLocation> locations;

  GeoList({Key key, @required this.locations}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GeoListState();
}

class GeoListState extends State<GeoList> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("building GeoListState");
    animationController.forward();
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
      child: Scaffold(
        body: ListView.builder(
            itemCount: widget.locations.length,
            itemBuilder: (context, index) {
              return GeoListItem(
                location: widget.locations[index],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
