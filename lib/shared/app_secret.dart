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

  static const baseUrl = 'http://localhost:3000';
  static const loginUrl = '${baseUrl}/api/v1/user_sessions';
  static const getUserUrl = '${baseUrl}/api/v1/user_sessions/get_user';
  static const resetPasswordUrl =
      '${baseUrl}/api/v1/user_sessions/reset_password';
  static const getFuelLogsUrl = '${baseUrl}/api/v1/fuel_entries';
}
