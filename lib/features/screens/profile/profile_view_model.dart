import 'package:learningdart/features/data/profile/profile_service.dart';
import 'package:learningdart/shared/app_secret.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/model/user_model.dart';

class ProfileViewModel {
  final ProfileService profileService;

  ProfileViewModel(this.profileService);
  @override
  Future<void> updatePassword(String password, String confirmPassword) async {
    /// Prepare header
    const String apiUrl = AppSecret.resetPasswordUrl;
    Map<String, String> headerData = {'Authorization': AppSecret.accessToken};
    // prepare body
    Map<String, String> data = {
      "password": password,
      "confirm_password": confirmPassword
    };
    print(password);
    print(confirmPassword);
    print(data);

    try {
      /// reset password call using confirm_password and password in body
      await profileService.resetPassword(apiUrl,
          body: data, headers: headerData);
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
