import 'package:learningdart/features/data/login/login_service.dart';
import 'package:learningdart/shared/app_secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/model/user_model.dart';

class LoginViewModel {
  final LoginService loginService;

  LoginViewModel(this.loginService);
  @override
  Future<void> login(String email, String password) async {
    /// Prepare data
    Map<String, String> data = {"email": email, "password": password};
    const String apiUrl = AppSecret.loginUrl;
    Map<String, String> headerData = {"Content-Type": 'application/json'};

    try {
      UserModel? user;

      /// login call using email and password in body
      Map<String, dynamic> apiResponse =
          await loginService.signIn(apiUrl, body: data, headers: headerData);

      AppSecret.accessToken = apiResponse["meta"]['auth_token'];
      user = UserModel.fromJson(apiResponse);
      print('********************');
      print(user);
      if (user?.accessToken?.isEmpty ?? true) {
        throw Exception('Access is not given');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

/// Dependency Injection
final loginViewModelProvider = Provider<LoginViewModel>(
  (ref) => LoginViewModel(ref.read(loginServiceProvider)),
);
