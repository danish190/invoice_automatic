// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String message;
  bool status;
  Data data;

  LoginResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  UserDetails userDetails;
  ProfileDetails profileDetails;
  bool isOnTrail;
  bool isPremium;
  String token;

  Data({
    required this.userDetails,
    required this.profileDetails,
    required this.isOnTrail,
    required this.isPremium,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: UserDetails.fromJson(json["userDetails"] ?? {"": ""}),
        profileDetails: ProfileDetails.fromJson(json["profileDetails"] ?? ""),
        isOnTrail: json["isOnTrail"],
        isPremium: json["isPremium"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userDetails": userDetails.toJson(),
        "profileDetails": profileDetails.toJson(),
        "isOnTrail": isOnTrail,
        "isPremium": isPremium,
        "token": token,
      };
}

class ProfileDetails {
  String profilePicture;
  String bussinessName;
  String bussinessAddress;
  String bussinessNumber;
  String bussinessUrl;
  String paymentType;

  ProfileDetails({
    required this.profilePicture,
    required this.bussinessName,
    required this.bussinessAddress,
    required this.bussinessNumber,
    required this.bussinessUrl,
    required this.paymentType,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
        profilePicture: json["profile_picture"],
        bussinessName: json["bussiness_name"],
        bussinessAddress: json["bussiness_address"],
        bussinessNumber: json["bussiness_number"],
        bussinessUrl: json["bussiness_url"],
        paymentType: json["payment_type"],
      );

  Map<String, dynamic> toJson() => {
        "profile_picture": profilePicture,
        "bussiness_name": bussinessName,
        "bussiness_address": bussinessAddress,
        "bussiness_number": bussinessNumber,
        "bussiness_url": bussinessUrl,
        "payment_type": paymentType,
      };
}

class UserDetails {
  String firstName;
  String lastName;
  String name;
  String email;

  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        firstName: json["firstName"],
        lastName: json["lastName"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "name": name,
        "email": email,
      };
}
