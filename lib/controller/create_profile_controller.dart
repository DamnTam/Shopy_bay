import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/controller/verify_otp_controller.dart';
import 'package:shopy_bay/data/models/create_profile_parameter_model.dart';
import 'package:shopy_bay/data/models/user_profile.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class CreateProfileController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> createProfile(CreateProfileParameter createProfileParameter) async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller().postRequest(
      url: Urls.createProfileUrl,
      body: createProfileParameter.toJson(),
      token: Get.find<VerifyOtpController>().token!,
    );
    _isLoading = false;
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserDetails(
          Get.find<VerifyOtpController>().token!,
          UserModel.fromJson(response.responseData['data']));
      update();
      return true;
    } else {
      _errorMessage = 'profile Creation Failed';
      update();
      return false;
    }
  }
}
