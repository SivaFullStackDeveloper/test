// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    required this.token,
    required this.appFcmToken,
    required this.user,
  });

  String token;
  String appFcmToken;
  User user;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    token: json["token"],
    appFcmToken: json["appFcmToken"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "appFcmToken": appFcmToken,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.role,
  });

  String id;
  String email;
  String phone;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "role": role,
  };
}
