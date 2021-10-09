import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/models/pointcategory.dart';

class PointInfo extends StatelessWidget {
  PointCategory info;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.MAIN_COLOR,
        margin: EdgeInsets.all(20),
        child: Stack(children: [
          Positioned.fill(
              child: Container(
            color: Colors.amber,
          )),
          Center(
              child: ClipRRect(
                  child: Image.asset(
            // 'assets/images/' + this.info.screenshot + '.png',
            'assets/images/pokrovskie.png',
            fit: BoxFit.cover,
          ))),
          SizedBox(height: 50),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('hello',
                      style: TextStyle(color: Colors.white, fontSize: 25))
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Назад')),
        ]));
  }
}
