import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';
import 'package:geo/models/geo_location.dart';

import 'package:geo/widgets/geo_list_item_widget.dart';

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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Discover',
            style: TextStyle(color: GeoColors.black),
          ),
          elevation: 0.5,
          leading: IconButton(
            icon: ImageIcon(
              AssetImage('assets/icons/menu.png'),
              color: GeoColors.black,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/icons/funnel.png'),
                color: GeoColors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return GeoListItem(
                location: locations[index],
                imageName: 'assets/images/location-$index.jpg',
              );
            }),
      ),
    );
  }
}
