import 'package:get/get.dart';
import 'package:shopy_bay/data/models/user_profile.dart';
import 'package:shopy_bay/data/service/network_caller.dart';

import '../data/utilities/urls.dart';

class ReadProfileController extends GetxController {
  UserProfile _userProfile = UserProfile();
  UserProfile get userProfile => _userProfile;

  Future<bool> ReadProfile(String token) async {
    final response = await NetWorkCaller().getRequest(
        Urls.readProfileUrl, token: token);
    if (response.isSuccess) {
      if (response.responseData['data'].length == 0) {
        return false;
      }
      else {
        _userProfile = UserProfile.fromJson(response.responseData['data'][0]);
        return true;
      }
    }
    else{
      return false;
    }
  }
}