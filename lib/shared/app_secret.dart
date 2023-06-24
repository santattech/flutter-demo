class AppSecret {
  static var accessToken;
  static Map<String, dynamic> unauthorizedLogin = {
    'code': 404,
    'message': 'Please check your credential'
  };
  static Map<String, dynamic> unauthorized = {
    'code': 404,
    'message': 'Access denied'
  };

  static const loginUrl = 'http://localhost:3000/api/v1/user_sessions';
  static const getUserUrl =
      'http://localhost:3000/api/v1/user_sessions/get_user';
  static const resetPasswordUrl =
      'http://localhost:3000/api/v1/user_sessions/reset_password';
}
