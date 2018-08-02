import 'package:test/test.dart';

import 'package:geo/models/geo_location.dart';

///
/// Tests [GeoLocation]
///

void main() {
  test('location should have a distance description', () {
    expect(GeoLocation(distance: 24.0).distanceDescription(), '24.0Km');
  });
}
