import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// [ProfileService] is responsible for calling sign in API

class ProfileService {
  final http.Client client;

  ProfileService(this.client);

  // for the GetUser API
  Future<Map<String, dynamic>> getUser(String url,
      {Map<String, String>? headers}) async {
    try {
      /// HTTP GET request
      http.Response response =
          await client.get(Uri.parse(url), headers: headers);
      return parseResponseBody(response);
    } catch (e) {
      rethrow;
    }
  }

  // For the ResetPassword API
  Future<Map<String, dynamic>> resetPassword(String url,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      /// HTTP PUT request
      http.Response response =
          await client.put(Uri.parse(url), body: body, headers: headers);
      return parseResponseBody(response);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> parseResponseBody(http.Response response) {
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("response ${jsonDecode(response.body)}");
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
final profileServiceProvider =
    Provider<ProfileService>((ref) => ProfileService(http.Client()));
