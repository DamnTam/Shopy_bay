
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';


import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class AddToCartController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> addToCart(int productId,String color,String size,int quantity) async {
    Map<String, dynamic> body = {
      "product_id": productId,
      "color":color,
      "size":size,
      "qty": quantity,
    };
    _isLoading = true;
    update();
    try{
      final response = await NetWorkCaller().postRequest(
        url: Urls.addToCartUrl,
        body: body,
        token: Get.find<AuthController>().token.toString(),
      );
      _isLoading = false;
      if (response.isSuccess) {
        update();
        return true;
      }
      else {
        _errorMessage = response.errorMessage;
        update();
        return false;
      }
    }
    catch(e){
      _errorMessage = e.toString();
      update();
      return false;
    }
  }
}
