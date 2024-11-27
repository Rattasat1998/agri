import 'dart:convert';

import 'package:agri/screens/home/pages/training_schedule/models/logo_model.dart';
import 'package:agri/screens/home/pages/training_schedule/models/train_user_model.dart';
import 'package:agri/screens/home/pages/training_schedule/models/training_model.dart';
import 'package:agri/screens/home/pages/training_schedule/repository/base_training_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TrainingRepository implements BaseTrainingRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<TrainingModel> getTrainingByDate({required String date}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getTrainingByDate.replaceFirst('{date}', date)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return TrainingModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load training');
    }
  }

  @override
  Future<TrainingDetailModel> getTrainingById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getTrainingById.replaceFirst('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return TrainingDetailModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load training');
    }
  }

  @override
  Future registerTraining({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.registerTraining));
    request.bodyFields = {
      'train_id': id,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      CustomToast.show(json['message']);
      return json;
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Future deleteTrainingById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse(baseUrl + ApiEndPoint.deleteTrainingById.replaceFirst('{id}', id)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Future<LogoModel> getLogos() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getLogo));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return LogoModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      // throw Exception('Failed to load training admin only');
      print('Failed to load training logo admin only');
      return LogoModel(result: false, message: 'Failed to load training admin only', data: null);
    }
  }

  @override
  Future addEditTraining({
    required String date,
    required String time,
    required String logoId,
    required String title,
    required String detail,
    String? trainingId,
    required bool isEdit,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    print(isEdit);
    try {
       http.Request request;
      if(isEdit){
            request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.editTraining.replaceFirst('{id}', trainingId!)));
          } else {
        request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.addTraining));
          }
      print(request.url);
      request.bodyFields = {
            'img_id': logoId,
            'train_name': title,
            'address': detail,
            'train_date': date,
            'train_time': time,
          };
      print(request.bodyFields);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode  >= 200 && response.statusCode <= 300) {
            final json = jsonDecode(await response.stream.bytesToString());
            // CustomToast.show(json['message']);
            return json;
          }
          else {
            print('Failed to load training');
            print(response.reasonPhrase);
          }
    } catch (e) {
      print(e);
    }

  }

  @override
  Future<TrainUserModel?> getUserRegisterTrainingById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getTrainingUsersById.replaceFirst('{id}', id)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return TrainUserModel.fromJson(json);
    } else {
    print(response.reasonPhrase);
    throw Exception('Failed to load training');
    }

  }
}
