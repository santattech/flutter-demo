import 'package:learningdart/features/data/profile/profile_service.dart';
import 'package:learningdart/shared/app_secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/model/user_model.dart';

class ProfileViewModel {
  final ProfileService profileService;

  ProfileViewModel(this.profileService);
  @override
  Future<void> getUser() async {
    /// Prepare header
    UserModel? user;
    print('----------------------');
    print(user);
    const String apiUrl = AppSecret.getUserUrl;
    Map<String, String> headerData = {
      "Content-Type": 'application/json',
      'Authorization': AppSecret.accessToken
    };

    try {
      /// login call using email and password in body
      Map<String, dynamic> apiResponse =
          await profileService.getUser(apiUrl, headers: headerData);

      //user = UserModel.fromJson(apiResponse);
      // if (user?.accessToken?.isEmpty ?? true) {
      //   throw Exception('Access is not given');
      // }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

/// Dependency Injection
final profileViewModelProvider = Provider<ProfileViewModel>(
  (ref) => ProfileViewModel(ref.read(profileServiceProvider)),
);
