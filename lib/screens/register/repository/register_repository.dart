import 'dart:convert';
import 'package:agri/models/group_model.dart';
import 'package:agri/screens/register/repository/base_register_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class RegisterRepository implements BaseRegisterRepository {
  String baseUrl = dotenv.get('BASE_URL');

  @override
  Future<GroupModel> getGroups() async {
    var headers = {'Accept': 'application/json'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getGroup));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load groups');
    }
  }

  @override
  Future verifyOTP(String phoneNumber, String otp) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.verifyOTP));
    request.bodyFields = {
      'phone': phoneNumber,
      'otp': otp,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to verify OTP');
    }
  }

  @override
  Future sendOTP(String phoneNumber) async {
    var headers = {'Accept': 'application/json'};
    print(baseUrl + ApiEndPoint.sendOTP.replaceAll('{phoneNumber}', phoneNumber));
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.sendOTP.replaceAll('{phoneNumber}', phoneNumber)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
       final json = jsonDecode(await response.stream.bytesToString());
       return json;
    } else {
      print(response.reasonPhrase);
       final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showError(json['message'] ?? '');
      // return json;
      throw Exception('Failed to send OTP');
    }
  }

  @override
  Future register({
    required String groupId,
    required String firstName,
    required String lastName,
    required String tel,
    required String dateOfBirth,
    required String numberFields,
    required String password,
    required String confirmPassword,
    required bool isAcceptTerms,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.register));
    request.bodyFields = {
      'group_id': groupId,
      'firstname': firstName,
      'lastname': lastName,
      'tel': tel,
      'date_of_birth': dateOfBirth,
      'number_fields': numberFields,
      'password': password,
      'password_confirmation': confirmPassword,
      'accept_policy': isAcceptTerms ? '1' : '0',
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.show(status: json['message'] ?? '');
      return json;
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to register');
    }
  }
}
