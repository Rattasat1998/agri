import 'dart:convert';

import 'package:agri/screens/machinery_map/models/machinery_map_model.dart';
import 'package:agri/screens/machinery_map/repository/base_machinery_map_repository.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../utils/api_end_point.dart';

class MachineryMapRepository implements BaseMachineryMapRepository {

  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<MachineryMapModel> getMachineryMap() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineryMapList));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return MachineryMapModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }

  }
}