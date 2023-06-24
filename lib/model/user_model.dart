class UserModel {
  String? id;
  String? accessToken;
  String? email;
  String? lastSignInAt;
  String? currentSignInAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.accessToken,
    this.email,
    this.currentSignInAt,
    this.lastSignInAt,
    this.updatedAt,
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
    updatedAt = json['data']['attributes']['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accessToken'] = accessToken;

    data['email'] = email;
    data['lastSignInAt'] = lastSignInAt;
    data['currentSignInAt'] = currentSignInAt;
    data['updatedAt'] = updatedAt;

    return data;
  }
}
