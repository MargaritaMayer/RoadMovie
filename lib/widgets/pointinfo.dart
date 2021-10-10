import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/models/pointcategory.dart';

class PointInfo extends StatelessWidget {
  PointCategory info;
  PointInfo({this.info});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            color: Colors.transparent,
            margin:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 25),
            child: Container(
              color: AppColors.NEXT_COLOR,
              // margin: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 0),
                      alignment: Alignment.topLeft,
                      child: Text(info.name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'Futura',
                              color: AppColors.LAST_COLOR,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                  Container(
                      margin: const EdgeInsets.only(
                          top: 0, left: 10, right: 10, bottom: 0),
                      alignment: Alignment.topLeft,
                      child: Text(
                          'Importance: ' +
                              info.numberOfPointColor +
                              ' out of 3',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontFamily: 'Futura',
                              color: AppColors.LAST_COLOR,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  Container(
                    margin: EdgeInsets.all(10),
                    color: AppColors.NEXT_COLOR,
                    height: 250,
                    child: Positioned.fill(
                        child: ClipRRect(
                            // opacity: 0.3,
                            child: Image.asset(
                                'assets/images/' + info.screenshot + '.png',
                                fit: BoxFit.cover))),
                  ),
                  Center(
                      child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text('Movie description: ' + info.description,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontFamily: 'Futura',
                                      color: AppColors.LAST_COLOR,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text('Location description: ' + info.movieinfo,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontFamily: 'Futura',
                                      color: AppColors.LAST_COLOR,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      SizedBox(height: 5),
                      Container(
                          width: 100,
                          child: Material(
                              color: AppColors.MAIN_COLOR,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      width: 200,
                                      padding: const EdgeInsets.all(20),
                                      child: const Text(
                                        'RETURN',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Futura',
                                            color: AppColors.LAST_COLOR,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )))))
                    ],
                  ))
                ],
              ),
            )));
  }
}
