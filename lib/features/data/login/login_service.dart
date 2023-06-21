import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

/// [LoginService] is responsible for calling sign in API

class LoginService {
  final http.Client client;

  LoginService(this.client);

  Future<Map<String, dynamic>> signIn(String url,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    try {
      /// HTTP POST request
      http.Response response = await client.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      return parseResponseBody(response);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> parseResponseBody(http.Response response) {
    print(response.statusCode);
    if (response.statusCode == 201) {
      print("response ${jsonDecode(response.body)}");
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode == 404) {
      throw Exception('Wrong creds');
    } else if (response.statusCode == 401) {
      throw Exception('Wrong creds');
    } else {
      throw Exception('Something went wrong');
    }
  }
}

/// Dependency Injection
final loginServiceProvider =
    Provider<LoginService>((ref) => LoginService(http.Client()));
