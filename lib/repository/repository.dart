import 'dart:convert';

import 'package:agri/repository/base_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Repository implements BaseRepository {
  final baseUrl = dotenv.env['BASE_URL']!;


  @override
 Future changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.changePassword));
    request.bodyFields = {
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': confirmPassword,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      final json = {
        "result": false,
        "message": "รหัสผ่านเดิมไม่ถูกต้อง"
      };
      print(response.statusCode);
      print(response.reasonPhrase);
      return json;
    }

  }
}