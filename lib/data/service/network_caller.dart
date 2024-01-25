import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:shopy_bay/data/models/response_data.dart';

class NetWorkCaller {
  Future<ResponseData> getRequest(String url, {String? token}) async {
    log('url: $url');
    Response response = await get(Uri.parse(url), headers: {
      'token': token.toString(),
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200) {
      log('statusCode: ${response.statusCode}');
      log('response: ${response.body}');
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse['data'],
          errorMessage: decodedResponse['msg'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: null,
        errorMessage: '',
      );
    }
  }

  Future<ResponseData> postRequest(
      {required String url,
      required Map<String, dynamic>? body,
      required String token}) async {
    log('url: $url');
    Response response = await post(Uri.parse(url), body: body, headers: {
      'token': token.toString(),
      'Content-Type': 'application/json'
    });
    if (response.statusCode == 200) {
      log('statusCode: ${response.statusCode}');
      log('response: ${response.body}');
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse['data'],
          errorMessage: decodedResponse['msg'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: null,
        errorMessage: '',
      );
    }
  }
}
