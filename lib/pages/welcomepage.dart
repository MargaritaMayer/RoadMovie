// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/pages/movielistpage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.NEXT_COLOR,
      child: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                  child: ClipOval(
                child: Container(
                    width: 220,
                    height: 220,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/welcome.png')),
              )),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  child: Column(
                    children: [
                      Text('ROAD\nMOVIE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Futura',
                            color: AppColors.LAST_COLOR,
                            fontSize: 50,
                          )),
                      SizedBox(height: 20),
                      Text('Feel as you are\nthe main hero\nof the movie',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Futura',
                            color: AppColors.LAST_COLOR,
                            fontSize: 20,
                          )),
                      SizedBox(height: 70),
                      Material(
                          color: AppColors.MAIN_COLOR,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryListPage()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    ' START    ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Futura',
                                        color: AppColors.LAST_COLOR,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ))))
                    ],
                  ))
            ],
          ))
        ],
      ),
    ));
  }
}
