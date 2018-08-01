import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:geo/models/geo_location.dart';

///
/// Fetches geo based data from a JSON API
///

class GeoClient {
  Future<List<GeoLocation>> fetchLocations() async {
    print('making http request');
    final response = await http.get(
        'https://willyweather-stub.getsandbox.com/v2/key/search/closest.json?id=193&distance=km&weatherTypes=swell');

    print('got http response');
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      final List<GeoLocation> result = [];

      for (var entry in decoded['swell']) {
        result.add(GeoLocation(
            name: entry['name'],
            lat: entry['lat'],
            long: entry['lng'],
            distance: entry['distance'].toDouble(),
            region: entry['region'],
            state: entry['state']));
      }

      return result;
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
