import 'package:get/get.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/data/models/cart_model.dart';
import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';
import 'delete_cart_controller.dart';

class CartController extends GetxController {
  bool _isLoading = false;
  String _errorMessage = '';
  CartModel _cartModel = CartModel();
  CartModel get cartModel => _cartModel;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  RxDouble get totalAmount => _totalAmount;
  RxDouble _totalAmount=0.0.obs;

  Future<bool> getCart() async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller()
        .getRequest(Urls.getCartUrl, token: Get.find<AuthController>().token);
    _isLoading = false;
    if (response.isSuccess) {
      _cartModel = CartModel.fromJson(response.responseData);
      _totalAmount.value=calculateTotalPrice;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  void updateQuantity(int id, int quantity) {
    _cartModel.cartList?.firstWhere((element) => element.id == id).qty = quantity;
    _totalAmount.value = calculateTotalPrice;
  }
  double get calculateTotalPrice{
    double total = 0;
    for (CartItem item in _cartModel.cartList??[]) {
      total += (double.tryParse(item.price??'0')??0)*item.qty;
    }
    return total;
  }
 void removeItem(int id)async {
    await Get.find<DeleteCartController>().deleteCard(id);
    _totalAmount.value = calculateTotalPrice;
    update();
  }
}
