import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointCategory {
  String name;
  String screenshot;
  String description;
  String movieinfo;
  String numberOfPointColor;
  List<PointCategory> subPoints;
  LatLng coordinates;

  PointCategory(
      {this.name,
      this.screenshot,
      this.description,
      this.movieinfo,
      this.numberOfPointColor,
      this.subPoints,
      this.coordinates});
}
