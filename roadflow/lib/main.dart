import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 10.5544921, longitude: 76.221368), // Provide initial position
    // initMapWithUserPosition: UserTrackingOption(
    //   enableTracking: true,
    //   unFollowUser: false,
    // ), // Set to true if you want to initialize with user's position
  );
  final controller = MapController.withPosition(
            initPosition: GeoPoint(
              latitude: 10.5544921,
              longitude: 76.221368,
          ),
);

  var currentLatti=10.5544921;
  var currentLng=76.221368;
  Future<void> _getLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLatti=position.latitude;
    currentLng=position.longitude;
    print('Original GPS Coordinates: ${position.latitude}, ${position.longitude}');
    // Do something with the original coordinates
  } catch (e) {
    print('Error getting location: $e');
  }
}
GeoPoint test = GeoPoint(latitude: 10.5544921, longitude: 76.221368);
void _addMarker(GeoPoint coordinates, String title) {
    mapController.addMarker(
      coordinates,
      markerIcon: const MarkerIcon(icon: Icon(Icons.place,color: Colors.red,)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
           leading: IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,), // Options Icon on the left side
            onPressed: () {
              // Handle menu icon tap
            },
          ),
          actions: <Widget>[
            // Account Icon on the right side
            IconButton(
              icon: const Icon(Icons.account_circle,color: Colors.white,),
              onPressed: () {
                print("debug");
              },
            ),
          ],
          backgroundColor: Colors.green,
          centerTitle: true, title: const Text('RoadFlow',
          style:TextStyle(color: Colors.white)),
           // Set the title of the AppBar
        ),


         body:
         Column(
          children: [
            Expanded(
              child:OSMFlutter( 
        controller:mapController,
        osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
              enableTracking: true,
              unFollowUser: false,
            ),
            zoomOption: const ZoomOption(
                  initZoom: 19,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
            ),
            userLocationMarker: UserLocationMaker(
                personMarker: const MarkerIcon(
                    icon: Icon(
                        Icons.location_history_rounded,
                        color: Colors.red,
                        size: 48,
                    ),
                ),
                directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                        Icons.double_arrow,
                        size: 48,
                    ),
                ),
            ),
            roadConfiguration: const RoadOption(
                    roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.person_pin_circle,
                      color: Colors.blue,
                      size: 56,
                    ),
                ),
            ),
        )
    ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Locate original GPS coordinates
            //       _getLocation();
            //     },
            //     child: const Icon(Icons.location_on),
            //   ),
            // ),
          ],
         ),
         floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getLocation();
            GeoPoint targetCoordinate = GeoPoint(latitude: currentLatti, longitude: currentLng); // Replace with your target coordinates
            mapController.goToLocation(targetCoordinate);
            _addMarker(targetCoordinate,"title");
            // print("test--${currentLatti}, ${currentLng}'");
            
          },
          child: Icon(Icons.location_searching_rounded,color: Colors.white,),
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    ),
      );
  }
}
