import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:learningdart/shared/reponse_code.dart';

/// [ProfileService] is responsible for calling sign in API

class ProfileService {
  final http.Client client;

  ProfileService(this.client);

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
    } else if (response.statusCode == 422) {
      throw Exception(ResponseCode.unprocessable['code']);
    } else if (response.statusCode == 401) {
      throw Exception(ResponseCode.unauthorized['code']);
    } else {
      throw Exception(ResponseCode.internalError['code']);
    }
  }
}

/// Dependency Injection
final profileServiceProvider =
    Provider<ProfileService>((ref) => ProfileService(http.Client()));
