import 'dart:convert';

import 'package:agri/screens/login/repository/base_login_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoginRepository implements BaseLoginRepository {
  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future login(String phoneNumber, String password) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.login));
    request.bodyFields = {'tel': phoneNumber, 'password': password};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    } else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return json;
    }
  }

  @override
  Future<void> logout() async {
    final token = await LocalStorage.getToken();

    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE', Uri.parse(baseUrl + ApiEndPoint.logout));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to logout');
    }
  }

  @override
  Future storeFcmToken(String fcm) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.storeFcm));
    request.bodyFields = {'device_token': fcm};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    } else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return json;
    }
  }

  @override
  Future forgotPasswordChangePassword({
    required String tel,
    required String newPassword,
    required String newPasswordConfirm,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.changeForgotPassword));
    request.bodyFields = {
      'tel': tel,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirm,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
    }

  }

  @override
  Future forgotPasswordGetOTP({required String phoneNumber}) async {
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.forgotPassword.replaceAll('{phoneNumber}', phoneNumber)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
  }

  @override
  Future forgotPasswordVerifyOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.verifyForgotPassword));
    print(request.url);
    request.bodyFields = {
      'phone': phoneNumber,
      'otp': otp,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }

  }
}
