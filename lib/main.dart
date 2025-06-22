import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/Controllers/theme_controller.dart';
import 'package:tic_tac_toa/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Tic Tac Toe',
          theme: themeController.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        ));
  }
}
