import 'package:get/get.dart';
import 'package:tic_tac_toa/controllers/splash_controller.dart';
import 'package:tic_tac_toa/views/game_screen.dart';
import 'package:tic_tac_toa/views/home_screen.dart';
import 'package:tic_tac_toa/views/splash_screen.dart';

class AppPages {
  static const initial = '/splash';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/game',
      page: () => const GameScreen(),
    ),
  ];
}
