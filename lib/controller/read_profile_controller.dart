import 'package:get/get.dart';
import 'package:shopy_bay/data/models/user_profile.dart';
import 'package:shopy_bay/data/service/network_caller.dart';

import '../data/utilities/urls.dart';

class ReadProfileController extends GetxController {
  UserModel _userModel = UserModel();
  UserModel get userModel => _userModel;

  Future<bool> ReadProfile(String token) async {
    final response = await NetWorkCaller().getRequest(
        Urls.readProfileUrl, token: token);
    if (response.isSuccess) {
      if (response.responseData['data']==null) {
        return false;
      }
      else {
        _userModel = UserModel.fromJson(response.responseData['data']);
        return true;
      }
    }
    else{
      return false;
    }
  }
}