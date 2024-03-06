import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class ApiMethods {
  static Dio dio = Dio();

  static Future<Response> postRequest(Map<String, dynamic> headers,
      {required Map<String, dynamic> data, required url}) async {
    try {
      FormData formData = FormData.fromMap(data);
      Response response = await dio.post(url, data: formData,
          onSendProgress: (int sent, int total) {
          },
          options: Options(
            followRedirects: true,
            sendTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
            validateStatus: (status) => true,
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode! == 401) {
        return response;
      }  else if (response.statusCode! == 402) {
        return response;
      }  else if (response.statusCode! == 422) {
        return response;
      }else if (response.statusCode! == 302) {
        return response;
      } else if (response.statusCode! == 500) {
        return response;
      } else {
        return response;
      }
    } on DioException catch (e) {
      print("e ${e.message}");
      if (e.message == "Receiving data timeout[50000ms]") {
        throw Exception("Receiving data timeout[50000ms]");
      }
      if (e.message == "Http status error [401]") {
        throw Exception("Http status error [401]");
      } else if (e.message == "Http status error [500]") {
        throw Exception("Http status error [500]");
      } else if (e.message == "Sending timeout[50000ms]") {
        throw Exception("Sending timeout[50000ms]");
      }
      throw Exception(e.message);
    }
  }

  static Future<Response> postRawDataRequest(Map<String, dynamic> headers,
      {required Map<String, dynamic> data, required url}) async {
    try {
      // dio.FormData formData = dio.FormData.fromMap(data);

      Response response = await dio.post(url, data: jsonEncode(data),
          onSendProgress: (int sent, int total) {
            print(sent);
          },
          options: Options(
            followRedirects: true,
            sendTimeout: Duration(milliseconds: 50000),
            receiveTimeout: Duration(milliseconds: 50000),
            validateStatus: (status) => true,
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode! == 401) {
        return response;
      } else if (response.statusCode! == 302) {
        return response;
      } else if (response.statusCode! == 500) {
        return response;
      } else {
        return response;
      }
    } on DioException catch (e) {
      print("e ${e.message}");
      if (e.message == "Receiving data timeout[50000ms]") {
        throw Exception("Receiving data timeout[50000ms]");
      }
      if (e.message == "Http status error [401]") {
        throw Exception("Http status error [401]");
      } else if (e.message == "Http status error [500]") {
        throw Exception("Http status error [500]");
      }
      throw Exception(e.message);
    }
  }

  static Future<String> postRequestResponse(
      {required Map<String, dynamic> data, required url}) async {
    Response response = await ApiMethods.postRequest(
        {"Accept": "application/json"},
        data: data, url: url);
    try {
      if (response.statusCode == 200) {
        return "200";
      } else if (response.statusCode == 401) {
        return "401";
      } else if (response.statusCode == 302) {
        return "302";
      } else if (response.statusCode == 500) {
        return "500";
      } else {
        return "Failed";
      }
    } on DioException catch (e) {
      if (e.message == "Receiving data timeout[50000ms]") {
        return "Connection error";
      }
      if (e.message == "Http status error [401]") {
        return "401";
      }
      return "Failed";
    }
  }

  static Future<Response> getMethod(
      BuildContext context, get, 
       {required Map<String, dynamic> headers, required String url 
      }) async {
    Response response = await dio.get(
      url,
      options: Options(
          responseType: ResponseType.json,
          headers: headers,
          receiveTimeout: Duration(milliseconds: 20000),
          sendTimeout: Duration(milliseconds: 20000),
          validateStatus: (status){
            return status! < 500;
          },
          receiveDataWhenStatusError: false),
    );
    // print(response.statusCode);
    if (response.statusCode! >= 400) {
      // Preferences.saveAuthId("");
      // Preferences.saveFirstName("");
      // Preferences.saveLastName("");
      // Preferences.saveUserName("");
      // Preferences.saveProfilePicture("");
  
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
      print("response.statusCode 404");
    }
    print("response $response");
  
    return response;
  }

  // static Future<dio.Response> patchMethod(
  //     BuildContext context, {required Map<String, dynamic> headers, required String url }) async {
  //   Response response = await dioObj.patchUri(
  //     Uri.parse(url),
  //     options: Options(
  //         responseType: ResponseType.json,
  //         headers: headers,
  //         receiveTimeout: Duration(milliseconds: 20000),
  //         sendTimeout: Duration(milliseconds: 20000),
  //         validateStatus: (status){
  //           return status! < 500;
  //         },
  //         receiveDataWhenStatusError: false),
  //   );
  //   // print(response.statusCode);
  //   if (response.statusCode! >= 400) {
  //     Preferences.saveAuthId("");
  //     Preferences.saveFirstName("");
  //     Preferences.saveLastName("");
  //     Preferences.saveUserName("");
  //     Preferences.saveProfilePicture("");
  //
  //     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     print("response.statusCode 404");
  //   }
  //   print("response
  // $response");
  //
  //   return response;
  // }

  // static Future<dio.Response> deleteMethod(
  //     {required Map<String, dynamic> headers, required String url}) async {
  //   Response response = await dioObj.deleteUri(
  //     Uri.parse(url),
  //     options: Options(
  //         responseType: ResponseType.json,
  //         headers: headers,
  //         receiveTimeout: Duration(milliseconds: 20000),
  //         validateStatus: (status) {
  //           return status! < 500;
  //         },
  //         sendTimeout: Duration(milliseconds: 20000),
  //         receiveDataWhenStatusError: false),
  //   );
  //   if (response.statusCode == 404) {
  //     print("404");
  //     return response;
  //   }
  //   print(response);
  //
  //   return response;
  // }
}
