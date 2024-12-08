import 'dart:convert';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_model.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AgriInfoRepository {
  Future addQuestionNew(Map<String, dynamic> question) async {
    final token = await LocalStorage.getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('https://agri-app.extremesofts.com/api/add-question/user'));
    request.body = json.encode(question);
    request.headers.addAll(headers);

    print('token: $token');
    print('question: ${request.url}');

    print(jsonEncode(question));

    try {
      http.StreamedResponse response = await request.send();

      print('status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(await response.stream.bytesToString());
        // print('response: $jsonBody');
      } else {
        print(response.reasonPhrase);
        // print(await response.stream.bytesToString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future addQuestion(Map<String, dynamic> question) async {
    final token = await LocalStorage.getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('https://agri-app.extremesofts.com/api/add-question'));
    request.body = json.encode(question);
    request.headers.addAll(headers);

    print(question);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(await response.stream.bytesToString());
        print(jsonBody);
      } else {
        print(response.reasonPhrase);
        // print(await response.stream.bytesToString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<StaffInfoModel> getStaffInfo() async {
    var headers = {'Accept': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('https://agri-app.extremesofts.com/api/interviewer-lists'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return StaffInfoModel.fromJson(jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load staff info');
    }
  }
}
