// To parse this JSON data, do
//
//     final profileResponseError = profileResponseErrorFromJson(jsonString);

import 'dart:convert';

ProfileResponseError profileResponseErrorFromJson(String str) => ProfileResponseError.fromJson(json.decode(str));

String profileResponseErrorToJson(ProfileResponseError data) => json.encode(data.toJson());

class ProfileResponseError {
    String message;
    bool status;
    Data data;

    ProfileResponseError({
        required this.message,
        required this.status,
        required this.data,
    });

    factory ProfileResponseError.fromJson(Map<String, dynamic> json) => ProfileResponseError(
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
    Errors errors;

    Data({
        required this.errors,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        errors: Errors.fromJson(json["errors"]?? false) ,
    );

    Map<String, dynamic> toJson() => {
        "errors": errors.toJson(),
    };
}

class Errors {
    List<String> bussinessUrl;

    Errors({
        required this.bussinessUrl,
    });

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        bussinessUrl: List<String>.from(json["bussiness_url"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "bussiness_url": List<dynamic>.from(bussinessUrl.map((x) => x)),
    };
}
