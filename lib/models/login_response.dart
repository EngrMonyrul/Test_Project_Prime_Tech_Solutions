// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int? code;
  String? message;
  UserCredentials? data;

  LoginResponse({
    this.code,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : UserCredentials.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserCredentials {
  int? id;
  String? name;
  String? email;
  String? token;

  UserCredentials({
    this.id,
    this.name,
    this.email,
    this.token,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) => UserCredentials(
        id: json["Id"],
        name: json["Name"],
        email: json["Email"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Email": email,
        "Token": token,
      };
}
