import 'dart:convert';

import 'package:agri/screens/home/pages/statistics/models/statistics_history_borrow_detail_model.dart';
import 'package:agri/screens/home/pages/statistics/models/statistics_history_group_model.dart';
import 'package:agri/screens/home/pages/statistics/models/statistics_model.dart';
import 'package:agri/screens/home/pages/statistics/repository/base_statistics_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class StatisticsRepository implements BaseStatisticsRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<StatisticsHistoryBorrowDetailModel> getBorrowDetailById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getBorrowDetailById.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return StatisticsHistoryBorrowDetailModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      return StatisticsHistoryBorrowDetailModel(result: false, message: response.reasonPhrase, data: null);
    }

  }

  @override
  Future<StatisticsHistoryGroupModel> getHistoryInGroup({required int pageNumber}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    try {
      var request = http.Request(
            'GET',
            Uri.parse(
              baseUrl +
                  ApiEndPoint.getHistoryInGroup.replaceAll(
                    '{pageNumber}',
                    pageNumber.toString(),
                  ),
            ),
          );
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
            final json = jsonDecode(await response.stream.bytesToString());
            return StatisticsHistoryGroupModel.fromJson(json);
          } else {
            print(response.reasonPhrase);
            throw Exception('Failed to load history in group');
          }
    } catch (e) {
      print(e);
      throw Exception('catch Failed to load history in group');
    }
  }

  @override
  Future<StatisticsHistoryGroupModel> getHistoryOutGroup({required int pageNumber}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(baseUrl +
            ApiEndPoint.getHistoryOutGroup.replaceAll('{pageNumber}', pageNumber.toString())));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return StatisticsHistoryGroupModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load statistics');
    }
  }

  @override
  Future<StatisticsModel> getStatistics() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getStatistics));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return StatisticsModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load statistics');
    }
  }

  @override
  Future receiveMachinery({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.receiveMachinery.replaceAll('{id}', id)));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to receive machinery');
    }
  }

  @override
  Future returnMachinery({required String id,required double rating}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.returnMachinery.replaceAll('{id}', id)));
    request.bodyFields = {
      'rating': rating.toString(),
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(request.bodyFields);
    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to return machinery');
    }
  }
}
