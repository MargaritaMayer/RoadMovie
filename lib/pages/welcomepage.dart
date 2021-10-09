// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/pages/movielistpage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
                  opacity: 0.3,
                  child:
                      Image.asset('assets/images/map.png', fit: BoxFit.cover))),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: ClipOval(
                child: Container(
                    width: 180,
                    height: 180,
                    color: AppColors.MAIN_COLOR,
                    alignment: Alignment.center,
                    child:
                        Icon(Icons.favorite, color: Colors.white, size: 100)),
              )),
              SizedBox(height: 50),
              Text('Welcome to RoadMovie!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              Text('purpose of the app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Material(
                  color: Colors.amber,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryListPage()));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Go choose a movie to open its route',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ))))

              // Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: FlatButton(
              //       color: Colors.green,
              //       padding: EdgeInsets.all(25),
              //       child: Text('Go choose a movie to open its route'),
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => CategoryListPage()));
              //       },
              //     ))
            ],
          ))
        ],
      ),
    ));
  }
}
