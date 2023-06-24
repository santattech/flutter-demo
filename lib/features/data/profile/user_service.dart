import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:learningdart/model/user_model.dart';
import 'package:learningdart/shared/app_secret.dart';

/// [UserService] is responsible for calling getUser API

class UserService {
  final http.Client client;

  UserService(this.client);

  // for the GetUser API
  Future<UserModel> getUser() async {
    // call the getUser API
    const String apiUrl = AppSecret.getUserUrl;
    Map<String, String> headerData = {
      "Content-Type": 'application/json',
      'Authorization': AppSecret.accessToken,
    };

    try {
      http.Response response =
          await http.get(Uri.parse(apiUrl), headers: headerData);

      return UserModel.fromJson(parseResponseBody(response));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> parseResponseBody(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Wrong creds');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorize');
    } else {
      throw Exception('Something went wrong');
    }
  }
}

/// Dependency Injection
final userServiceProvider =
    Provider<UserService>((ref) => UserService(http.Client()));
