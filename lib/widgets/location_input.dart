import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:location/location.dart';

class InputLocation extends StatefulWidget {
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  String previewImageUrl;

  Future<void> _getUserCurrentLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(latitude: locData.latitude,longitude: locData.longitude);
    setState(() {
      previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 170.0,
          child: (previewImageUrl == null)
              ? Text(
                  'No Image chosen!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getUserCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
