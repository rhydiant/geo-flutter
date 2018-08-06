import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_layout.dart';

import 'package:geo/widgets/geo_hero_header_widget.dart';
import 'package:geo/widgets/geo_map_image_widget.dart';
import 'package:geo/widgets/geo_rating_widget.dart';

///
/// Renders location details
///

class GeoDetail extends StatelessWidget {
  final GeoLocation location;

  const GeoDetail({Key key, @required this.location}) : super(key: key);

  List<dynamic> _buildListWigets() {
    final List<Widget> children = [];

    children.add(Container(
      padding: const EdgeInsets.only(
        top: standardPadding,
        left: standardPadding,
      ),
      child: Text(
        '${location.name}',
        style: const TextStyle(fontSize: 21.0),
      ),
    ));

    children.add(Container(
      padding: const EdgeInsets.only(
        left: standardPadding,
        top: standardHalfPadding,
      ),
      child: const GeoRating(score: 2),
    ));

    children.add(Container(
      padding: const EdgeInsets.all(standardPadding),
      child: GeoMapImage(
        title: location.name,
        long: location.long,
        lat: location.lat,
        height: 150.0,
      ),
    ));

    children.add(
      Container(
          padding: const EdgeInsets.all(standardPadding),
          child: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at convallis neque, vitae scelerisque justo. In vel auctor lectus. Fusce quis neque nec dolor facilisis pharetra. Vivamus blandit, magna id lacinia scelerisque, justo est varius tellus, eu suscipit odio mi id ante.')),
    );

    children.add(Container(
      padding: const EdgeInsets.all(standardPadding),
      child: const Text(
        'Nearby',
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    ));

    children.add(Container(
      height: 100.0,
      padding: const EdgeInsets.only(
          left: standardPadding,
          right: standardPadding,
          bottom: standardPadding),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: standardHalfPadding),
            child: const Image(
              image: const AssetImage('assets/images/location-1.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: standardHalfPadding),
            child: const Image(
              image: const AssetImage('assets/images/location-2.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: standardHalfPadding),
            child: const Image(
              image: const AssetImage('assets/images/location-3.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: standardHalfPadding),
            child: const Image(
              image: const AssetImage('assets/images/location-4.jpg'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: standardHalfPadding),
            child: const Image(
              image: const AssetImage('assets/images/location-5.jpg'),
            ),
          ),
        ],
      ),
    ));

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: _GeoPersistentHeaderDelegate(
              title: location.name,
              imageName: location.imageUrl,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(_buildListWigets()),
          ),
        ],
      ),
    );
  }
}

///
/// _GeoPersistentHeaderDelegate
///

class _GeoPersistentHeaderDelegate implements SliverPersistentHeaderDelegate {
  final String title;
  final String imageName;

  const _GeoPersistentHeaderDelegate(
      {Key key, @required this.title, this.imageName});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: GeoHeroHeader(
        title: title,
        imageName: imageName,
      ),
    );
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
