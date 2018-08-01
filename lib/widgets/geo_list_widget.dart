import 'package:flutter/material.dart';

import '../models/geo_location.dart';
import 'geo_list_item_widget.dart';

///
/// Renders a [ListView] of locations
///
/// Each list item is rendered using the [GeoListItem] widget
///

class GeoList extends StatelessWidget {
  final List<GeoLocation> locations;
  final animationController;

  const GeoList({Key key, @required this.locations, this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0.5,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('nearby'),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.adjust),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GeoListItem(
                  location: locations[index],
                );
              },
              childCount: locations.length,
            ),
          ),
        ],
      ),
    );
  }
}
