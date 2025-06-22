// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toa/controllers/splash_controller.dart';
import 'package:tic_tac_toa/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tic_tac_toa/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Get.isDarkMode
                ? [
                    AppColors.background,
                    AppColors.surface,
                    AppColors.primary.withOpacity(0.3),
                  ]
                : [
                    AppColors.primary.withOpacity(0.1),
                    AppColors.secondary.withOpacity(0.3),
                    AppColors.primary.withOpacity(0.2),
                  ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              Obx(() => AnimatedScale(
                    scale: splashController.animationProgress.value,
                    duration: const Duration(milliseconds: 100),
                    child: AnimatedOpacity(
                      opacity: splashController.animationProgress.value,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SvgPicture.asset(
                              'assets/images/splash_logo.svg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),

              const SizedBox(height: 40),

              // Animated App Name
              Obx(() => splashController.animationProgress.value > 0.7
                  ? AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          GameConstants.appName,
                          textStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? AppColors.white
                                : AppColors.black,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                    )
                  : const SizedBox.shrink()),

              const SizedBox(height: 20),

              // Loading indicator
              Obx(() => splashController.animationProgress.value > 0.9
                  ? Column(
                      children: [
                        const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.primary),
                          strokeWidth: 3,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Loading...',
                          style: TextStyle(
                            fontSize: 16,
                            color: Get.isDarkMode
                                ? AppColors.white.withOpacity(0.8)
                                : AppColors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
