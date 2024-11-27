import 'dart:convert';
import 'package:agri/screens/dashboard/models/dashboard_model.dart';
import 'package:agri/screens/dashboard/repository/base_dashboard_repository.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:http/http.dart' as http;

class DashBoardRepository implements BaseDashboardRepository {
  String baseUrl = dotenv.get('BASE_URL');
  @override
  Future<DashboardModel> getDashboardData({required apiEndPoint}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + apiEndPoint));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      print(json);
      return DashboardModel.fromJson(json);
    }
    else {
    print(response.reasonPhrase);
    return DashboardModel(result: false, message: '', data: null);
    throw Exception('Failed to load data');
    }
  }
}