import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

///
/// Provides access to external API keys
///

class GeoKeys {
  final String googleMapsApiKey;

  GeoKeys({this.googleMapsApiKey = ""});

  factory GeoKeys.fromJson(Map<String, dynamic> jsonMap) {
    return new GeoKeys(googleMapsApiKey: jsonMap["google_maps_api_key"]);
  }

  static Future<GeoKeys> load() {
    return rootBundle.loadStructuredData<GeoKeys>('assets/keys.json',
        (jsonStr) async {
      return GeoKeys.fromJson(json.decode(jsonStr));
    });
  }
}
