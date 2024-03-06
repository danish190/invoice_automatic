// To parse this JSON data, do
//
//     final registrationResponse = registrationResponseFromJson(jsonString);

import 'dart:convert';

RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());

class RegistrationResponse {
    String message;
    bool status;
    Data data;

    RegistrationResponse({
        required this.message,
        required this.status,
        required this.data,
    });

    factory RegistrationResponse.fromJson(Map<String, dynamic> json) => RegistrationResponse(
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
    bool profile;
    String status;
    String token;
    User user;

    Data({
        required this.profile,
        required this.status,
        required this.token,
        required this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: json["profile"],
        status: json["status"],
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "profile": profile,
        "status": status,
        "token": token,
        "user": user.toJson(),
    };
}

class User {
    String firstName;
    String lastName;
    String name;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    User({
        required this.firstName,
        required this.lastName,
        required this.name,
        required this.email,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
