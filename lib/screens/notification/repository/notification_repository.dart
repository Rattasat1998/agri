import 'dart:convert';

import 'package:agri/screens/notification/models/notification_model.dart';
import 'package:agri/screens/notification/repository/base_notification_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NotificationRepository implements BaseNotificationRepository {

  final String baseUrl = dotenv.env['BASE_URL']!;
  @override
  Future<NotificationModel> getNotifications({required int pageNumber}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getNotification.replaceAll('{pageNumber}', pageNumber.toString())));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return NotificationModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<int> getNotificationCount() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getNotificationCount));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json['data']['notification_count'];
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }


  }



  @override
  Future readedNotification({required int id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('PUT', Uri.parse(baseUrl + ApiEndPoint.readedNotification.replaceAll('{id}', id.toString())));

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
}