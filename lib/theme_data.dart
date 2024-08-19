import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static final ThemeData primaryTheme = ThemeData(
      canvasColor: AppColor.backgroundNavigator,
      primaryColor: AppColor.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.backgroundNavigator,
        unselectedItemColor: AppColor.greyColor,
        unselectedIconTheme: IconThemeData(color: AppColor.greyColor),
        selectedIconTheme: IconThemeData(color: AppColor.goldColor, size: 30),
        selectedItemColor: AppColor.goldColor,
        showUnselectedLabels: true,
      ),
      appBarTheme: AppBarTheme(color: AppColor.primaryColor));
}
