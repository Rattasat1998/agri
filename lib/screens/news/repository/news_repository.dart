import 'dart:convert';

import 'package:agri/models/category_model.dart';
import 'package:agri/models/news_model.dart';
import 'package:agri/screens/news/repository/base_news_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class NewsRepository implements BaseNewsRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<CategoryModel> getCategory() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getCategory));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return CategoryModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<NModel> getNews() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getNewsAll));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return NModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future getNewsByCategory(String categoryId, String pageNumber) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
      'GET',
      Uri.parse(
        '$baseUrl${ApiEndPoint.getNewsByCategory.replaceAll('{categoryId}', categoryId).replaceAll('{pageNumber}', pageNumber)}',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return NModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<NewsDetailModel> getNewsDetail(String newsId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    final url = '$baseUrl${ApiEndPoint.getNewsDetailById.replaceAll('{newsId}', newsId)}';
    var request = http.Request('GET', Uri.parse(url));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return NewsDetailModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future addNews({
    required String categoryId,
    required String newsTitle,
    required String newsDescription,
    required String newsImg,
  })  async {
    print('addNews called');
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.addNews));
    request.fields.addAll({
      'category_id': categoryId,
      'news_title': newsTitle,
      'description': newsDescription,
    });
      request.files.add(await http.MultipartFile.fromPath('news_img', newsImg));
    print(request.fields);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
    final json = jsonDecode(await response.stream.bytesToString());
    print( json);
    EasyLoading.show(status: json['message'] ?? '');
    return json;

    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }
  }

  @override
  Future updateNews({
    required String newsId,
    required String categoryId,
    required String newsTitle,
    required String newsDescription,
    required String newsImg,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.updateNewsById.replaceAll('{newsId}', newsId)));
    request.fields.addAll({
      'category_id': categoryId,
      'news_title': newsTitle,
      'description': newsDescription,
    });
    if(newsImg.isNotEmpty){
      request.files.add(await http.MultipartFile.fromPath('news_img', newsImg));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    final json = jsonDecode(await response.stream.bytesToString());

    EasyLoading.show(status: json['message'] ?? '');
    return json;
    }
    else {
    print(response.reasonPhrase);
    throw Exception('Failed to load data!');
    }
  }

  @override
  Future deleteNews(String newsId) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE', Uri.parse(baseUrl + ApiEndPoint.deleteNewsById.replaceAll('{newsId}', newsId)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      EasyLoading.show(status: json['message'] ?? '');
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
