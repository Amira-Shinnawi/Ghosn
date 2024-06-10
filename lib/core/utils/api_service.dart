import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ghosn_app/constants.dart';
import 'package:ghosn_app/core/utils/Api_Key.dart';
import 'package:http/http.dart' as http;

class APIService {
  final _baseURL = ApiKeys.BASE_URL;
  final Dio dio;

  APIService(this.dio);
//map
  Future<Map<String, dynamic>> getProfile(
      {required String endPoint, Options? options}) async {
    var response = await dio.get('$_baseURL$endPoint', options: options);
    return response.data;
  }

//list of map
  Future<List<dynamic>> listOfMap(
      {required String endPoint, Options? options}) async {
    var response = await dio.get('$_baseURL$endPoint', options: options);

    return response.data as List<dynamic>;
  }

  Future<List<dynamic>> searchUser(
      {required String endPoint, Options? options}) async {
    var response = await dio.get('$_baseURL$endPoint', options: options);
    return response.data;
  }

  Future<void> deletePost(int id) async {
    try {
      var response = await http.delete(
        Uri.parse('$_baseURL/api/Auth/DeletePost/$id'),
        headers: {
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode == 200) {
        print('Post deleted successfully');
      } else {
        print('Failed to delete post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting post: $e');
    }
  }

  //map
  Future<Map<String, dynamic>> detectPlant(
      {required String endPoint, Options? options, Object? data}) async {
    var response =
        await dio.post('$_baseURL$endPoint', options: options, data: data);
    var responseDate = json.decode(response.data);
    return responseDate;
  }
}
