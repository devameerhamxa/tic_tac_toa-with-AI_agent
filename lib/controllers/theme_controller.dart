import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/utils/colors.dart';

class ThemeController extends GetxController {
  var isDarkMode = true.obs;

  ThemeData get theme => isDarkMode.value ? _darkTheme : _lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(theme);
  }

  ThemeData get _darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          color: AppColors.surface,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      );

  ThemeData get _lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      );
}
