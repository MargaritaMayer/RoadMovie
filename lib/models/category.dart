import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/pointcategory.dart';

class Category {
  String name;
  String icon;
  Color color;
  String imgName;
  String number;
  List<Category> subCategories;

  List<PointCategory> points;

  Category(
      {this.name,
      this.icon,
      this.color,
      this.imgName,
      this.subCategories,
      this.points,
      this.number});
}
