///
/// Represents a geographical location
///

class GeoLocation {
  final String name;
  final double long;
  final double lat;
  final double distance;
  final String region;
  final String state;
  final String imageUrl;

  GeoLocation(
      {this.name,
      this.long,
      this.lat,
      this.distance,
      this.region,
      this.state,
      this.imageUrl});

  @override
  String toString() {
    return 'GeoLocation name: $name, long: $long, lat: $lat, distance: $distance region: $region, state: $state, imageUrl: $imageUrl';
  }

  String distanceDescription() {
    return '${distance}Km';
  }
}
