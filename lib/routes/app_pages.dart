import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tic_tac_toa/views/game_screen.dart';
import 'package:tic_tac_toa/views/home_screen.dart';

class AppPages {
  static const initial = '/home';

  static final routes = [
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
