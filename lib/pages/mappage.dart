// // ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/helpers/utilspoints.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/models/pointcategory.dart';
import 'package:flutter_application_4/widgets/pointinfo.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

String YOUR_API = '<YOUR_API>';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
  Category selectedCategory;
  MapPage({Key key, this.selectedCategory}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<PointCategory> pointsList;
  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor bestPoint;
  BitmapDescriptor middlePoint;
  BitmapDescriptor lowPoint;

  LatLng currentLocation;
  LatLng destinationLocation;

  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();
  Set<Polygon> _polygones = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  PolylineResult result;

  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();

    // set up initial locations
    // this.setInitialLocation();
  }

  void setSourceAndDestinationMarkerIcons(BuildContext context) async {
    bestPoint = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/icon1.png');

    middlePoint = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/icon2.png');

    lowPoint = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/icon3.png');
  }

  // void setInitialLocation() {
  //   currentLocation =
  //       LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);

  //   destinationLocation =
  //       LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  // }

  @override
  Widget build(BuildContext context) {
    this.setSourceAndDestinationMarkerIcons(context);

    // ignore: prefer_const_constructors
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: widget.selectedCategory.points[0].coordinates);

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            polylines: _polylines,
            polygons: _polygones,
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
        Container(
            padding:
                const EdgeInsets.only(top: 33, left: 10, bottom: 0, right: 0),
            alignment: Alignment.topLeft,
            // width: 100,
            child: Material(
                color: AppColors.MAIN_COLOR,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        // width: 200,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'MENU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Futura',
                              color: AppColors.LAST_COLOR,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )))))
      ],
    ));
  }

  BitmapDescriptor iconReturn(String number) {
    if (number == '1') {
      return lowPoint;
    }
    if (number == '2') {
      return middlePoint;
    }
    if (number == '3') {
      return bestPoint;
    }
  }

  void showPinsOnMap() {
    pointsList = UtilsPoints.getPoints(widget.selectedCategory.number);

    setState(() {
      for (int i = 0; i < pointsList.length; i++) {
        _markers.add(Marker(
            markerId: MarkerId(pointsList[i].name),
            position: pointsList[i].coordinates,
            icon: iconReturn(pointsList[i].numberOfPointColor),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PointInfo(
                            info: pointsList[i],
                          )));
            }));
      }
    });
  }

  PolylineResult setMultiplePolylines(point1, point2) {
    // pointsList = Utils.getPoints();
    PolylineResult result = polylinePoints.getRouteBetweenCoordinates(
        YOUR_API,
        PointLatLng(point1.latitude, point1.longitude),
        PointLatLng(point2.latitude, point2.longitude)) as PolylineResult;
    return result;
  }

  void setPolylines() async {
    pointsList = UtilsPoints.getPoints(widget.selectedCategory.number);
    LatLng saver;
    LatLng destination;
    setState(() {
      for (int i = 0; i < pointsList.length; i++) {
        if (i == 0) {
          saver = pointsList[i].coordinates;
        }
        if (i > 0) {
          destination = pointsList[i].coordinates;
          result = setMultiplePolylines(saver, destination);
          if (result.status == 'OK') {
            result.points.forEach((PointLatLng point) {
              polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            });
          }
        }
      }

      _polylines.add(Polyline(
          width: 5,
          polylineId: PolylineId('polyLine'),
          color: AppColors.MAIN_COLOR,
          points: polylineCoordinates));

      saver = destinationLocation;
    });
  }
}
