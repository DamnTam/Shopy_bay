import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/controller/verify_otp_controller.dart';
import 'package:shopy_bay/data/models/user_profile.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class CreateProfileController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> createProfile(String firstName, String mobile, String city,
      String shippingAddress) async {
    Map<String, dynamic> body = {
      "cus_name": firstName,
      "cus_add": "Shekhertek 8,Mohammadpur, Adabor, Dhaka-1207",
      "cus_city": city,
      "cus_state": "Dhaka",
      "cus_postcode": "1207",
      "cus_country": "Bangladesh",
      "cus_phone": mobile,
      "cus_fax": "01785388919",
      "ship_name": "Rabbil Hasan",
      "ship_add": shippingAddress,
      "ship_city": "Dhaka",
      "ship_state": "Dhaka",
      "ship_postcode": "1207",
      "ship_country": "Bangladesh",
      "ship_phone": "01785388919"
    };
    _isLoading = true;
    update();
    final response = await NetWorkCaller().postRequest(
      url: Urls.createProfileUrl,
      body: body,
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
