import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointCategory {
  String name;
  String screenshot;
  Text description;
  String numberOfPointColor;
  List<PointCategory> subPoints;
  LatLng coordinates;

  PointCategory(
      {this.name,
      this.screenshot,
      this.description,
      this.numberOfPointColor,
      this.subPoints,
      this.coordinates});
}
