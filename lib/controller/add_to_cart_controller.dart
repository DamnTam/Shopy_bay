import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/controller/verify_otp_controller.dart';
import 'package:shopy_bay/data/models/user_profile.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class AddToCartController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> addToCart(int productId,String color,String size) async {
    log(color);
    Map<String, dynamic> body = {
      "product_id": productId.toString(),
      "color":color,
      "size":size
    };
    _isLoading = true;
    update();
    final response = await NetWorkCaller().postRequest(
      url: Urls.addToCartUrl,
      body: body,
      token: Get.find<AuthController>().token.toString(),
    );
    _isLoading = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _errorMessage = 'profile Creation Failed';
      update();
      return false;
    }
  }
}
