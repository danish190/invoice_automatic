// To parse this JSON data, do
//
//     final loginErrorResponse = loginErrorResponseFromJson(jsonString);

import 'dart:convert';

LoginErrorResponse loginErrorResponseFromJson(String str) =>
    LoginErrorResponse.fromJson(json.decode(str));

String loginErrorResponseToJson(LoginErrorResponse data) =>
    json.encode(data.toJson());

class LoginErrorResponse {
  String message;
  bool status;
  List<dynamic> data;

  LoginErrorResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) =>
      LoginErrorResponse(
        message: json["message"],
        status: json["status"],
        data: List<dynamic>.from(json["data"].map((x) => x) ?? {[]}),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
