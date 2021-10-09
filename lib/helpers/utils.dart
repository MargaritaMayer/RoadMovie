import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/helpers/iconhelper.dart';
import 'package:flutter_application_4/models/pointcategory.dart';
import 'appcolors.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        color: AppColors.MAIN_COLOR,
        name: 'Покровские ворота',
        imgName: 'pokrovskie',
        icon: IconFontHelper.MEATS,
        subCategories: [],
      ),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Москва слезам не верит',
          imgName: 'moskva',
          icon: IconFontHelper.FRUITS,
          subCategories: []),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Я шагаю по Москве',
          imgName: 'shagau',
          icon: IconFontHelper.PASTRIES,
          subCategories: []),
      Category(
          color: AppColors.MAIN_COLOR,
          name: 'Служебный роман',
          imgName: 'roman',
          icon: IconFontHelper.SEEDS,
          subCategories: []),
    ];
  }
}
