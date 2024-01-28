import 'package:get/get.dart';
import 'package:shopy_bay/data/models/product_details_model.dart';
import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class ProductDetailsController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  ProductDetailsModel _productDetailsModel=ProductDetailsModel();
  ProductDetails get productDetails=>_productDetailsModel.productdetailsList?.first??ProductDetails();

  Future<bool> getProductDetails(int id) async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller().getRequest(
        Urls.productDetailsByIdUrl(id));
    _isLoading = false;
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
