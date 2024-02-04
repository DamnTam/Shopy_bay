import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/presentation/ui/screens/AuthScreen/email_screen.dart';
import 'package:shopy_bay/presentation/ui/widgets/shopybay_text.dart';
import '../../screens/AuthScreen/create_profile_screen.dart';

AppBar  myAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Image.asset('assets/images/appicon1.png',fit: BoxFit.contain,),
    ),
    title: shopyBayText(context, fontSize: 25),
    actions: [
      InkWell(
        onTap: () {
          //Get.find<AuthController>().clearAuthData();
         // Get.offAll(() => const EmailScreen());
          Get.to(() => const ProfileScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.person_outline_sharp)),
        ),
      ),
      InkWell(
        onTap: () async {
          await AuthController.clearAuthData();
          Get.offAll(() => const EmailScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
              backgroundColor: Colors.grey[200], child: Icon(Icons.logout)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.add_alert_rounded)),
      ),
    ],
  );
}