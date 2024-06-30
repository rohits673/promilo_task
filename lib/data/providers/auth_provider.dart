// data/providers/auth_provider.dart
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/login_request_model.dart';

class AuthProvider {
  final Dio _dio = Dio();

  AuthProvider() {
    _dio.options.baseUrl = 'https://apiv2stg.promilo.com';
    _dio.options.headers = {
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
    };
  }

  Future<bool> login(LoginRequestModel request) async {
    var bytes = utf8.encode(request.password);
    var digest = sha256.convert(bytes);
    String hashedPassword = digest.toString();

    final formData = FormData.fromMap({
      'username': request.email,
      'password': hashedPassword,
      'grant_type': 'password',
    });

    try {
      final response = await _dio.post('/user/oauth/token', data: formData);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      return false;
    }
  }
}
