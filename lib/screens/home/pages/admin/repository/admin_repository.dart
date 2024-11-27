import 'package:agri/screens/home/pages/admin/models/admin_model.dart';
import 'package:agri/screens/home/pages/admin/repository/base_admin_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminRepository implements BaseAdminRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<AdminModel> getAdminList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getAdminList));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return AdminModel.fromJson(jsonDecode(await response.stream.bytesToString()));
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }

  }
}