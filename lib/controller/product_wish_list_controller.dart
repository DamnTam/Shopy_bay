import 'package:get/get.dart';
import 'package:shopy_bay/data/models/wish_list_model.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';
import 'auth_controller.dart';

class ProductWishListController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  WishListModel _wishListModel = WishListModel();
  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishListProduct() async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller().getRequest(
        Urls.productWishListUrl, token: Get.find<AuthController>().token);
    _isLoading = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      wishListProductIds();
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  List<int> wishListProductIds() {
    List<int> list = [];
    _wishListModel.data?.forEach((element) {
      list.add(element.productId!);
    });

    return list;
  }

}

