import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/widgets/movieicon.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421, -71.1698939);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class SelectedMoviePage extends StatelessWidget {
  Category selectedCategory;
  SelectedMoviePage({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Container(child: Center(child: Text(this.selectedCategory.name))));
  }
}

// class Mappage extends StatefulWidget {
//   const Mappage({Key? key}) : super(key: key);

//   @override
//   _MappageState createState() => _MappageState();
// }

// class _MappageState extends State<Mappage> {
//   Completer<GoogleMapController> _controller = Completer();
//   BitmapDescriptor? sourceIcon;
//   BitmapDescriptor? destinationIcon;
//   Set<Marker> _markers = Set<Marker>();

//   LatLng? currentLocation;
//   LatLng? destinationLocation;

//   @override
//   void initState() {
//     super.initState();
//     this.setInitialLocation();
//   }

//   void setSourceAndDestinationMarkerIcons() async {
//     sourceIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), '/lib/images/image.png');

//     destinationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), '/lib/images/image.png');
//   }

//   void setInitialLocation() {
//     currentLocation =
//         LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
//     destinationLocation =
//         LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     CameraPosition initialCameraPosition = CameraPosition(
//         zoom: CAMERA_ZOOM,
//         tilt: CAMERA_TILT,
//         bearing: CAMERA_BEARING,
//         target: SOURCE_LOCATION);
//     return Scaffold(
//         body: Container(
//             child: GoogleMap(
//       myLocationEnabled: true,
//       compassEnabled: false,
//       tiltGesturesEnabled: false,
//       markers: _markers,
//       mapType: MapType.normal,
//       initialCameraPosition: initialCameraPosition,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     ))
//         // child: Center(
//         //     // child: Text('Map'),
//         //     child: RaisedButton(
//         //         onPressed: () {
//         //           Navigator.pop(context);
//         //         },
//         //         child: Text('Назад')))),
//         );
//   }
// }
