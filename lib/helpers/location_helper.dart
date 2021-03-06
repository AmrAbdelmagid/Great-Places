import 'dart:convert';
import 'dart:developer';

import 'package:location/location.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyCFq3SsSKk6vaeLGEdjDJiIK6FbITvEdnM';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<void> getPlaceAddress(double lat, double lng) async{
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['result'][0]['formatted_address'];
  }

}
