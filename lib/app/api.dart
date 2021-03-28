import 'dart:convert';
import 'dart:io';

import 'package:flutter_task/model/blog_list.dart';
import 'package:flutter_task/model/login_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._();

  static final ApiClient apiClient = ApiClient._();

  static final http.Client _httpClient = http.Client();

  //Method for login. getting token.
  Future<LoginResponse> createLoginState(
      String username, String password) async {
    var request = http.Request('POST',
        Uri.parse('https://60585b2ec3f49200173adcec.mockapi.io/api/v1/login'));

    http.StreamedResponse response = await request.send();

    //API result
    if (response.statusCode == 201) {
      String res = await response.stream.bytesToString();
      final parsed = json.decode(res);
      print("fff" + jsonEncode(parsed));
      return LoginResponse.fromJson(parsed);
    } else {
      print(response.reasonPhrase);
    }
  }

  //Method for blog list
  Future<List<ListBlog>> GetBlogList() async {
    try {
      final response = await _httpClient.get(Uri.parse(
          "https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs"));

      print("GetBlogList " + response.body);
      return parseMyBooking(response.body);
    } on SocketException {
      return Future.error("check your internet connection");
    } on http.ClientException {
      return Future.error("check your internet connection");
    } catch (e) {
      print("GetBlogList " + e.toString());
      return Future.error("Server Error");
    }
  }

  //API result
  static List<ListBlog> parseMyBooking(String responseBody) {
    print("GetCredits " + "calling");
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ListBlog>((json) => ListBlog.fromJson(json)).toList();
  }


  //Method for blog detail ID wise.
  Future<ListBlog> GetBlogDetails(String token, String id) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://60585b2ec3f49200173adcec.mockapi.io/api/v1/blogs/$id'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    //API result
    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      final parsed = json.decode(res);
      print("Detailed" + jsonEncode(parsed));
      return ListBlog.fromJson(parsed);
    } else {
      print(response.reasonPhrase);
    }
  }
}
