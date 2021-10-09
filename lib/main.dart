// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/pages/movielistpage.dart';
import 'package:flutter_application_4/pages/splashpage.dart';
import 'package:flutter_application_4/pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        duration: 3,
        goToPage: WelcomePage(),
      )));
}
