class UserModel {
  String? id;
  String? accessToken;
  String? email;
  String? lastSignInAt;
  String? currentSignInAt;

  UserModel({
    this.id,
    this.accessToken,
    this.email,
    this.currentSignInAt,
    this.lastSignInAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    print(json);

    if (json['meta'] != null) {
      accessToken = json['meta']['auth_token'];
    }

    email = json['data']['attributes']['email'];
    lastSignInAt = json['data']['attributes']['lastSignInAt'];
    currentSignInAt = json['data']['attributes']['currentSignInAt'];
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
