// // ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/widgets/pointinfo.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// const LatLng SOURCE_LOCATION = LatLng(55.751776945, 37.6163721083);
// const LatLng DEST_LOCATION = LatLng(55.751776980, 37.6163721183);
// const double CAMERA_ZOOM = 16;
// const double CAMERA_TILT = 80;
// const double CAMERA_BEARING = 30;
// // const double PIN_VISIBLE_POSITION = 20;
// // const double PIN_INVISIBLE_POSITION = -220;

// class Mappage extends StatefulWidget {
//   // Mappage({Key key}) : super(key: key);
//   Category selectedCategory;
//   // Mappage({this.selectedCategory});
//   @override
//   _MappageState createState() => _MappageState();
// }

// class _MappageState extends State<Mappage> {
//   LatLng currentLocation;
//   LatLng destinationLocation;
//   BitmapDescriptor sourceIcon;
//   BitmapDescriptor destinationIcon;
//   Set<Marker> _markers = Set<Marker>();
//   // final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
//   Completer<GoogleMapController> _controller = Completer();

//   @override
//   void initState() {
//     super.initState();

//     this.setInitialLocation();
//   }

//   void setSourceAndDestinationMarkerIcons(BuildContext context) async {
//     sourceIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), '/assets/images/icon.png');

//     destinationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), '/assets/images/icon2.png');
//   }

//   static final CameraPosition _moscow = CameraPosition(
//     target: LatLng(55.781776936, 37.6163721084),
//     zoom: 13,
//   );

//   void setInitialLocation() {
//     currentLocation =
//         LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

//     destinationLocation =
//         LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     this.setSourceAndDestinationMarkerIcons(context);
//     return Scaffold(
//         body: Stack(children: [
//       GoogleMap(
//         mapType: MapType.normal,
//         markers: _markers,
//         initialCameraPosition: _moscow,
//         myLocationButtonEnabled: true,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//           showPinsOnMap();
//         },
//       ),
//       // Text(widget.selectedCategory.name)
//     ]));
//   }

//   void showPinsOnMap() {
//     setState(() {
//       _markers.add(Marker(
//           markerId: MarkerId('soursePin'),
//           position: currentLocation,
//           icon: sourceIcon));

//       _markers.add(Marker(
//           markerId: MarkerId('destinationPin'),
//           position: destinationLocation,
//           icon: destinationIcon));
//     });
//   }
// }
const LatLng CAMERA_LOCATION = LatLng(55.75272615341363, 37.65665291369295);
const LatLng SOURCE_LOCATION = LatLng(55.75272615341363, 37.65665291369295);
const LatLng DEST_LOCATION = LatLng(55.82875656783303, 37.69921625006431);
const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  // double pinPillPosition = PIN_VISIBLE_POSITION;
  LatLng currentLocation;
  LatLng destinationLocation;
  // bool userBadgeSelected = false;

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();

    // set up initial locations
    this.setInitialLocation();
  }

  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/icon1.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/icon2.png');
  }

  void setInitialLocation() {
    currentLocation =
        LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

    destinationLocation =
        LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }

  @override
  Widget build(BuildContext context) {
    // CategorySelectionService catSelection = Provider.of<CategorySelectionService>(context, listen: false);
    // widget.subCategory = catSelection.selectedSubCategory;

    this.setSourceAndDestinationMarkerIcons(context);

    // ignore: prefer_const_constructors
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: CAMERA_LOCATION);

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            polylines: _polylines,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              showPinsOnMap();
              setPolylines();
            },
          ),
        ),
      ],
    ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon: sourceIcon,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PointInfo()));
          }));

      _markers.add(Marker(
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PointInfo()));
          }));

      _markers.add(Marker(
          markerId: MarkerId('anotherPin'),
          position: LatLng(55.82875456183303, 37.69721625006431),
          icon: destinationIcon,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PointInfo()));
          }));

      _markers.add(Marker(
          markerId: MarkerId('another2Pin'),
          position: LatLng(55.82375656783303, 37.69923625106431),
          icon: destinationIcon,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PointInfo()));
          }));
    });
  }
  // setPolylines() async {
  //  List<PointLatLng> result = await
  //     polylinePoints?.getRouteBetweenCoordinates(
  //        "AIzaSyB-k5ZfbwTabCJhK8pqeNMY3gY4Ze7-Aec",
  //        SOURCE_LOCATION.latitude,
  //        SOURCE_LOCATION.longitude,
  //        DEST_LOCATION.latitude,
  //        DEST_LOCATION.longitude);
  //  if(result.isNotEmpty){
  //     // loop through all PointLatLng points and convert them
  //     // to a list of LatLng, required by the Polyline
  //     result.forEach((PointLatLng point){
  //        polylineCoordinates.add(
  //           LatLng(point.latitude, point.longitude));
  //     });
  //  }
  //  setState(() {
  //     // create a Polyline instance
  //     // with an id, an RGB color and the list of LatLng pairs
  //     Polyline polyline = Polyline(
  //        polylineId: PolylineId('polyLine'),
  //        color: Color.fromARGB(255, 40, 122, 198),
  //        points: polylineCoordinates
  //     );

  //     // add the constructed polyline as a set of points
  //     // to the polyline set, which will eventually
  //     // end up showing up on the map
  //     _polylines.add(polyline);
  //   });

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDY1HsMJV8j5GIgbiMvme4Ejhob4LPE71s',
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polylines.add(Polyline(
            width: 5,
            polylineId: PolylineId('polyLine'),
            color: Colors.blue,
            points: polylineCoordinates));
      });
    }
  }
}
