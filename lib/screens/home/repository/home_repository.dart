import 'dart:convert';

import 'package:agri/models/home_model.dart';
import 'package:agri/screens/home/repository/base_home_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomeRepository implements BaseHomeRepository {

  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<HModel> getHomeData() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getHome));

    request.headers.addAll(headers);

    print(request.url);


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return HModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      return HModel(result: false, message: '', data: null, statusCode: response.statusCode);
      throw Exception('Failed to load data!');
    }

  }
}