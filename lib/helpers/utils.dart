import 'package:flutter_application_4/helpers/utilspoints.dart';
import 'package:flutter_application_4/models/category.dart';
import 'appcolors.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Pokrovskie gates',
          imgName: 'pokrovskie',
          subCategories: [],
          number: '1',
          points: UtilsPoints.getPoints('1')),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Walking the streets of Moscow',
          imgName: 'shagau',
          subCategories: [],
          points: UtilsPoints.getPoints('3'),
          number: '3'),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Office romance',
          imgName: 'roman',
          subCategories: [],
          points: UtilsPoints.getPoints('4'),
          number: '4'),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Moscow does not believe in tears',
          imgName: 'moskva',
          subCategories: [],
          points: UtilsPoints.getPoints('2'),
          number: '2'),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'The meeting place can not be changed',
          imgName: 'meetingplace',
          subCategories: [],
          points: UtilsPoints.getPoints('5'),
          number: '5'),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Carnival night',
          imgName: 'carnival',
          subCategories: [],
          points: UtilsPoints.getPoints('6'),
          number: '6'),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Beware of the car',
          imgName: 'car',
          subCategories: [],
          points: UtilsPoints.getPoints('7'),
          number: '7'),
    ];
  }
}
