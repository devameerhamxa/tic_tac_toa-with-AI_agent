import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;
  var animationProgress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    // Animate logo appearance
    for (int i = 0; i <= 100; i++) {
      animationProgress.value = i / 100;
      await Future.delayed(const Duration(milliseconds: 20));
    }

    // Hold the splash for a moment
    await Future.delayed(const Duration(milliseconds: 1500));

    // Navigate to home
    isLoading.value = false;
    Get.offAllNamed('/home');
  }
}
