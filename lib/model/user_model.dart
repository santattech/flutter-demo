class UserModel {
  int? id;
  String? accessToken;
  String? email;
  DateTime? lastSignInAt;
  DateTime? currentSignInAt;

  UserModel({
    this.id,
    this.accessToken,
    this.email,
    this.currentSignInAt,
    this.lastSignInAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    accessToken = json['meta']['auth_token'];

    email = json['email'];
    lastSignInAt = json['lastSignInAt'];
    currentSignInAt = json['currentSignInAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accessToken'] = accessToken;

    data['email'] = email;
    data['lastSignInAt'] = lastSignInAt;
    data['currentSignInAt'] = currentSignInAt;

    return data;
  }
}
