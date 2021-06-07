
import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:provider/provider.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Great Places!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PlacesProvider>(
            child: Text('Add Places Now!'),
            builder: (_, placesData, ch) => (placesData.places.length <= 0) ? ch : ListView.builder(
              itemBuilder: (_, i) => ListTile(
                leading: CircleAvatar(backgroundImage: FileImage(placesData.places[i].image)),
                title: Text(placesData.places[i].title),
              ),
              itemCount: placesData.places.length,
            ),
          ),
        ),
      ),
    );
  }
}
