import 'package:agri/screens/profile/pages/conclusion/models/family_info_model.dart';
import 'package:agri/screens/profile/pages/conclusion/models/system_rice_info_model.dart';
import 'package:agri/screens/profile/pages/conclusion/repository/base_conclusion_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConclusionRepository implements BaseConclusionRepository {

  final String baseUrl = dotenv.env['BASE_URL']!;


  Future _header() async {
    final token = await LocalStorage.getToken();
    return {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  }

  Future checkIsSummary() async {

    var request = http.Request('GET', Uri.parse('https://agri-app.extremesofts.com/api/summary/check'));

    request.headers.addAll(await _header());

    http.StreamedResponse response = await request.send();

      final json = jsonDecode(await response.stream.bytesToString());
      return json;


  }

  @override
  Future<SystemRiceInfoModel> getInfoConclusion() async {
    final url = baseUrl + ApiEndPoint.infoInSystemRice;
    var request = http.Request('GET', Uri.parse(url));

    print('url: $url');

    request.headers.addAll(await _header());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return SystemRiceInfoModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      EasyLoading.showError('Failed to load data! ');
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<FamilyInfoModel> getInfoIntroduction() async {
    final url = baseUrl + ApiEndPoint.infoIntro;
    var request = http.Request('GET', Uri.parse(url));

    print('url: $url');

    request.headers.addAll(await _header());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return FamilyInfoModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      EasyLoading.showError('Failed to load data! ');
      throw Exception('Failed to load data!');
    }

  }
}