// To parse this JSON data, do
//
//     final registrationErrorResponse = registrationErrorResponseFromJson(jsonString);

import 'dart:convert';


// const string = "// heloo ";

RegistrationErrorResponse registrationErrorResponseFromJson(String str) => RegistrationErrorResponse.fromJson(json.decode(str));

String registrationErrorResponseToJson(RegistrationErrorResponse data) => json.encode(data.toJson());

class RegistrationErrorResponse {
    String message;
    bool status;

    RegistrationErrorResponse({ 
        required this.message,
        required this.status,
    });

    factory RegistrationErrorResponse.fromJson(Map<String, dynamic> json) => RegistrationErrorResponse(
        message: json["message"] ?? false,
        status: json["status"] ?? false,
      
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
    };
}