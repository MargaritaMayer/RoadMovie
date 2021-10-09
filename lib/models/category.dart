import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/pointcategory.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Category {
  String name;
  String icon;
  Color color;
  String imgName;

  List<Category> subCategories;

  List<PointCategory> points;

  Category(
      {this.name, this.icon, this.color, this.imgName, this.subCategories});
}
