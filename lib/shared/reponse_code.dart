class ResponseCode {
  static Map<String, dynamic> unauthorizedLogin = {
    'code': 404,
    'exc': 'Exception: 404',
    'message': 'Please check your credential'
  };
  static Map<String, dynamic> unauthorized = {
    'code': 401,
    'exc': 'Exception: 401',
    'message': 'Access denied'
  };
  static Map<String, dynamic> unprocessable = {
    'code': 422,
    'exc': 'Exception: 422',
    'message': 'Unprocessable entity'
  };
  static Map<String, dynamic> internalError = {
    'code': 500,
    'exc': 'Exception: 500',
    'message': 'Internal server error'
  };
}
