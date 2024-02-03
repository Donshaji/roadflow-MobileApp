import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 37.7749, longitude: -122.4194), // Provide initial position
    // initMapWithUserPosition: true, // Set to true if you want to initialize with user's position
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
           leading: IconButton(
            icon: Icon(Icons.menu,color: Colors.white,), // Options Icon on the left side
            onPressed: () {
              // Handle menu icon tap
            },
          ),
          actions: <Widget>[
            // Account Icon on the right side
            IconButton(
              icon: Icon(Icons.account_circle,color: Colors.white,),
              onPressed: () {
                // Handle account icon tap
              },
            ),
          ],
          backgroundColor: Colors.green,
          centerTitle: true, title: Text('RoadFlow',
          style:TextStyle(color: Colors.white)),
           // Set the title of the AppBar
        ),
         body:Stack(),
        ),
      );
  }
}
