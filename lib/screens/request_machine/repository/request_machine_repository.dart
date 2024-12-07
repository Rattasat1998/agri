import 'dart:convert';

import 'package:agri/screens/request_machine/models/approve_request_detail_model.dart';
import 'package:agri/screens/request_machine/models/approve_request_model.dart';
import 'package:agri/screens/request_machine/repository/base_request_machine_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class RequestMachineRepository implements BaseRequestMachineRepository {

  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future approveBorrowInGroup(int borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    try {
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.approveRequestInGroup.replaceAll('{id}', borrowId.toString())));
      print(request.url);
      print(token);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
            final json = jsonDecode(await response.stream.bytesToString());
            return json;
          }
          else {
            print(response.reasonPhrase);
            throw Exception(response.reasonPhrase);
          }
    } catch (e) {
      EasyLoading.showError('catch : เกิดข้อผิดพลาด ${e.toString()}');
      print(e);
    }

    throw UnimplementedError();
  }

  @override
  Future approveBorrowOutGroup(int borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    try {
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.approveRequestOutGroup.replaceAll('{id}', borrowId.toString())));
      print(request.url);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
            final json = jsonDecode(await response.stream.bytesToString());
          return json;
          }
          else {
          print(response.reasonPhrase);
          throw Exception('Failed to load data!');
          }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<ApproveRequestDetailModel> getApproveInGroupByRequestId(String borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getDetailApproveInGroupById.replaceAll('{id}', borrowId.toString())));
    print(request.url);
    print(token);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    final json = jsonDecode(await response.stream.bytesToString());
    return ApproveRequestDetailModel.fromJson(json);
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }

  }

  @override
  Future<ApproveRequestDetailModel> getApproveOutGroupByRequestId(int borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getDetailApproveOutGroupById.replaceAll('{id}', borrowId.toString())));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return ApproveRequestDetailModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return ApproveRequestDetailModel.fromJson(json);
    }

  }




  @override
  Future refuseBorrowInGroup(int borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.refuseRequestInGroup.replaceAll('{id}', borrowId.toString())));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }

  }

  @override
  Future refuseBorrowOutGroup(int borrowId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.refuseRequestOutGroup.replaceAll('{id}', borrowId.toString())));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
    return json;
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }

  }
  @override
  Future<ApproveRequestModel> getRequestApproveInGroupList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getApproveInGroup));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return ApproveRequestModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }

  }

  @override
  Future<ApproveRequestModel> getRequestApproveOutGroupList() async {
    print('out group');
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getApproveOutGroup));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return ApproveRequestModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }

  }



  @override
  Future<ApproveRequestModel> getRequestHistoryInGroupList({required int pageNumber}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getRequestHistoryInGroup.replaceAll('{pageNumber}', pageNumber.toString())));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
    return ApproveRequestModel.fromJson(json);
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }

  }

  @override
  Future<ApproveRequestModel> getRequestHistoryOutGroupList({required int pageNumber}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getRequestHistoryOutGroup.replaceAll('{pageNumber}', pageNumber.toString())));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
    return ApproveRequestModel.fromJson(json);
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }

  }
}