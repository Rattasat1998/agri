import 'dart:convert';

import 'package:agri/screens/profile/models/profile_model.dart';
import 'package:agri/screens/profile/repository/base_profile_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class ProfileRepository implements BaseProfileRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future changeProfile({required String profileImg}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.changeProfile));
      request.files.add(await http.MultipartFile.fromPath('profile_img', profileImg));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final json = jsonDecode(await response.stream.bytesToString());
        EasyLoading.showSuccess(json['message'] ?? '');
      } else {
        print(response.reasonPhrase);
        throw Exception('Failed to upload data!');
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  @override
  Future editFirstName({
    required String firstname,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.editProfile));
    request.bodyFields = {
      'firstname': firstname,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showSuccess(json['message'] ?? '');
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to edit data!');
    }
  }

  @override
  Future editLastName({
    required String lastname,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.editProfile));
    request.bodyFields = {
      'lastname': lastname,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showSuccess(json['message'] ?? '');
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to edit data!');
    }
  }

  @override
  Future editDateOfBirth({
    required String dateOfBirth,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.editProfile));
    request.bodyFields = {
      'date_of_birth': dateOfBirth,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showSuccess(json['message'] ?? '');
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to edit data!');
    }
  }

  @override
  Future<PModel> getProfile() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getProfile));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return PModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future closeAccount({required String password}) async {
    final token = await LocalStorage.getToken();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('DELETE', Uri.parse(baseUrl + ApiEndPoint.closeAccount));
    request.bodyFields = {'password': password};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    } else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showError(json['message'] ?? '');
    }
  }

  @override
  Future restoreAccount({required String restoreToken}) async {
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(
        baseUrl + ApiEndPoint.restoreAccount.replaceFirst('{restore_token}', restoreToken)));

        request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.showError(json['message'] ?? '');
    }
  }
}
