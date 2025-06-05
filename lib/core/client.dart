import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data/models/create_user_model.dart';
import 'interceptor.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://172.20.10.2:8888/api/v1",
        validateStatus: (value) => true,
      ),
    );
    dio.interceptors.add(AuthInterceptor());
  }

  late final Dio dio;

  Future<Map<String, dynamic>> login({
    required String phoneNumber,
    required String password,
  }) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": phoneNumber, "password": password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      String token = data["accessToken"]!.toString();
      return {"result": true, "token": token};
    } else {
      return {"result": false, "token": null};
    }
  }

  Future<Map<String, dynamic>> signUp({required CreateUserModel user}) async {
    var response = await dio.post("/auth/register", data: user.toJson());
    if (response.statusCode == 201) {
      String token = response.data["accessToken"];
      return {"result": true, "token": token};
    } else {
      return {"result": true, "token": null};
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    try {
      final response = await dio.get('/categories/list');

      if (response.statusCode == 200) {
        final allData = List<Map<String, dynamic>>.from(response.data);
        final limitedData = allData.take(8).toList();
        return limitedData;
      } else {
        throw Exception('Categoriesda xatolik');
      }
    } catch (e) {
      debugPrint('fetchCategories xatolik: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> fetchSocialAccounts() async {
    try {
      final response = await dio.get('/social-accounts/list');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("SocailMediada Xatolik");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> fetchInterviews(int limit) async {
    try {
      final response = await dio.get('/interviews/list');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Interviewda xatolik bor!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchCourses({
    String? categoryId,
  }) async {
    try {
      final response = await dio.get(
        '/courses/list',
        queryParameters: {
          if (categoryId != null) 'CategoryId': categoryId,
        },
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Coursesda xatolik');
      }
    } catch (e) {
      debugPrint('fetchCourses xatolik: $e');
      rethrow;
    }
  }

}
