import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_client.dart';

///
/// Tests [GeoClient]
///

class MockClient extends Mock implements http.Client {}

void main() {
  group('GeoClient', () {
    test('should parse valid JSON response without error', () async {
      // stub the http response
      final MockClient mockClient = MockClient();
      when(mockClient.get(
              'https://willyweather-stub.getsandbox.com/v2/key/search/closest.json?id=193&distance=km&weatherTypes=swell'))
          .thenAnswer((_) async => http.Response('''
{
  "swell": [
    {
      "id": 19165,
      "name": "Coogee Beach",
      "region": "Sydney",
      "state": "NSW",
      "postcode": "0",
      "timeZone": "Australia/Sydney",
      "lat": -33.9210714,
      "lng": 151.2582421,
      "typeId": 2,
      "distance": 9
    }
  ]
}''', 200));

      expect(await GeoClient().fetchLocations(mockClient),
          isInstanceOf<List<GeoLocation>>());
    });
  });
}
