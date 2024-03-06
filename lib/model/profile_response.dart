// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
    String message;
    bool status;
    Data data;

    ProfileResponse({
        required this.message,
        required this.status,
        required this.data,
    });

    factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
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
    Profile profile;
    bool payment;
    String status;
    String token;

    Data({
        required this.profile,
        required this.payment,
        required this.status,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: Profile.fromJson(json["profile"]),
        payment: json["payment"],
        status: json["status"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "payment": payment,
        "status": status,
        "token": token,
    };
}

class Profile {
    int userId;
    dynamic profilePicture;
    String bussinessName;
    String bussinessAddress;
    String bussinessNumber;
    String bussinessUrl;
    String paymentType;
    dynamic stripekey;
    dynamic stripeSecretkey;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Profile({
        required this.userId,
        required this.profilePicture,
        required this.bussinessName,
        required this.bussinessAddress,
        required this.bussinessNumber,
        required this.bussinessUrl,
        required this.paymentType,
        required this.stripekey,
        required this.stripeSecretkey,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userId: json["user_id"],
        profilePicture: json["profile_picture"],
        bussinessName: json["bussiness_name"],
        bussinessAddress: json["bussiness_address"],
        bussinessNumber: json["bussiness_number"],
        bussinessUrl: json["bussiness_url"],
        paymentType: json["payment_type"],
        stripekey: json["Stripekey"],
        stripeSecretkey: json["StripeSecretkey"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "profile_picture": profilePicture,
        "bussiness_name": bussinessName,
        "bussiness_address": bussinessAddress,
        "bussiness_number": bussinessNumber,
        "bussiness_url": bussinessUrl,
        "payment_type": paymentType,
        "Stripekey": stripekey,
        "StripeSecretkey": stripeSecretkey,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
