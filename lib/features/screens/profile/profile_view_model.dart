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
    const String apiUrl = AppSecret.getUserUrl;
    Map<String, String> headerData = {
      "Content-Type": 'application/json',
      'Authorization': AppSecret.accessToken
    };
    UserModel user;

    try {
      /// login call using email and password in body
      Map<String, dynamic> apiResponse =
          await profileService.getUser(apiUrl, headers: headerData);

      user = UserModel.fromJson(apiResponse);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

/// Dependency Injection
/// this is the data provider
final profileViewModelProvider = Provider<ProfileViewModel>(
  (ref) => ProfileViewModel(ref.read(profileServiceProvider)),
);
