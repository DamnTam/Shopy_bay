import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/controller/read_profile_controller.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class VerifyOtpController extends GetxController{
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  bool _isProfileCompleted = false;
  bool get isProfileCompleted => _isProfileCompleted;
  String? token;

  Future<bool> verifyOtp(String email, String otp) async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller().getRequest(Urls.verifyOtpUrl(email, otp));
    if (response.isSuccess) {
      token = await response.responseData['data'];
      log('token: $token');
      await Future.delayed(Duration(seconds: 5), () {
      });
      final responseProfile = await Get.find<ReadProfileController>().ReadProfile(token!);
      if(responseProfile){
        await Get.find<AuthController>().saveUserDetails(token!, Get.find<ReadProfileController>().userProfile);
        _isProfileCompleted = true;
      }
      else{
        _isProfileCompleted = false;

      }
      _isLoading = false;
      update();
      return true;
    }
    else {

      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
      return false;

    }
  }
}