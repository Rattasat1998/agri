
import 'dart:convert';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_model.dart';
import 'package:http/http.dart' as http;


class AgriInfoRepository {

  Future addQuestion(Map<String, dynamic> question) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://agri-app.extremesofts.com/api/add-question'));
    request.body = json.encode(question);
    request.headers.addAll(headers);


    print(question);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(await response.stream.bytesToString());
            print(jsonBody);
          }
          else {
            print(response.reasonPhrase);
           // print(await response.stream.bytesToString());
          }
    } catch (e) {
      print(e);
    }

  }

  Future<StaffInfoModel> getStaffInfo() async {
    var headers = {
      'Accept': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://agri-app.extremesofts.com/api/interviewer-lists'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      return StaffInfoModel.fromJson(jsonDecode(await response.stream.bytesToString()));
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load staff info');
    }
  }


}