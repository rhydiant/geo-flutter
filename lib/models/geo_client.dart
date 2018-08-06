import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:geo/models/geo_location.dart';

///
/// Fetches geo based data from a JSON API
///

class GeoClient {
  Future<List<GeoLocation>> fetchLocations(http.Client client) async {
    print('making http request');
    final http.Response response = await client.get(
        'https://willyweather-stub.getsandbox.com/v2/key/search/closest.json?id=193&distance=km&weatherTypes=swell');

    print('got http response');
    if (response.statusCode == 200) {
      final dynamic decoded = json.decode(response.body);

      final List<GeoLocation> result = [];

      int i = 0;
      for (var entry in decoded['swell']) {
        result.add(GeoLocation(
            name: entry['name'],
            lat: entry['lat'],
            long: entry['lng'],
            distance: entry['distance'].toDouble(),
            region: entry['region'],
            state: entry['state'],
            imageUrl: 'assets/images/location-$i.jpg'));
        i++;
      }

      return result;
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
