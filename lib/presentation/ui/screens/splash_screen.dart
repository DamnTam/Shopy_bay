
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopy_bay/presentation/ui/screens/bottom_navScreen.dart';
import 'package:shopy_bay/presentation/ui/utility/app_colors.dart';
import 'package:shopy_bay/presentation/ui/utility/assets_path.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/presentation/ui/widgets/shopybay_text.dart';

import '../../../controller/auth_controller.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final bool isLogin = false;

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Get.find<AuthController>().initialize();
    await Future.delayed(const Duration(seconds: 4))
        .then((value) => Get.offAll(() => const BottomNavScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Lottie.asset(
                AssetsPath.applogo,
                width: 100,
              ),
            ),
            const SizedBox(height: 10),
            shopyBayText(context),
            const Spacer(),
            const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            const SizedBox(height: 20),
            const Text('Version 1.0'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
