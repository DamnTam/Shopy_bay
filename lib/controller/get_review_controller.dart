import 'package:get/get.dart';
import 'package:shopy_bay/data/models/review_model.dart';

import '../data/service/network_caller.dart';
import '../data/utilities/urls.dart';

class GetReviewController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  ReviewModel _reviewModel = ReviewModel();
  ReviewModel get reviewModel => _reviewModel;

  Future<bool> getReview(int id) async {
    _isLoading = true;
    update();
    final response = await NetWorkCaller().getRequest(
        Urls.listReviewByProduct(id));
    _isLoading = false;
    if (response.isSuccess) {
      _reviewModel = ReviewModel.fromJson(response.responseData);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}