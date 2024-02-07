import 'package:get/get.dart';
import 'package:shopy_bay/controller/product_wish_list_controller.dart';
import 'package:shopy_bay/data/models/wish_list_model.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';
import 'auth_controller.dart';

class CreateWishListController extends GetxController {
  bool _isLoading = false;
  bool isFavorite = false;
  WishListModel _wishListModel = WishListModel();
  WishListModel get wishListModel => _wishListModel;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> createWishList(int id) async {
    isFavorite = false;
    _isLoading = true;
    update();
    final response = await NetWorkCaller().getRequest(
        Urls.createWishListUrl(id), token: Get.find<AuthController>().token);
    _isLoading = false;
    if (response.isSuccess) {
      Get.find<ProductWishListController>().getWishListProduct();
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  void removeWishList(int id) async {
    _isLoading=true;
    update();
    final response = await NetWorkCaller().getRequest(
        Urls.removeWishListUrl(id),token: Get.find<AuthController>().token);
    _isLoading=false;
    if (response.isSuccess) {
      Get.find<ProductWishListController>().getWishListProduct();
      update();
    } else {
      _errorMessage = response.errorMessage;
      update();
    }
  }
}
