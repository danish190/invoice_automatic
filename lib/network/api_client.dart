import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:invoice_automatic/model/login_error_response.dart';
import 'package:invoice_automatic/model/login_response_model.dart';
import 'package:invoice_automatic/model/registration_error_response.dart';
import 'package:invoice_automatic/network/api_methods.dart';
import 'package:invoice_automatic/utils/constants.dart';
import '../model/profile_response.dart';
import '../model/profile_response_error.dart';
import '../model/registration_response.dart';
import '../utils/preferences.dart';

class ApiClient {
  Dio dio = Dio();

  static Future<dynamic> loginApi(
      {required String email, required String password}) async {
    Response response = await ApiMethods.postRequest(
        {"Accept": "application/json"},
        data: {"email": email, "password": password},
        url: Constants.baseUrl + Constants.loginApi);

    try {
      String responseJson = json.encode(response.data);

      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(responseJson);
        return loginResponse;
      } else {
        final loginErrorResponse = loginErrorResponseFromJson(responseJson);
        return loginErrorResponse;
      }
    } on DioException catch (e) {
      return e;
    }
  }

  static Future<dynamic> registrationApi(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    Response response = await ApiMethods.postRequest(
      {
      "Accept": "application/json"
    }, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword
    }, url: Constants.baseUrl + Constants.registrationApi);


    try {
      String responseJson = json.encode(response.data);
      if (response.statusCode == 200) {
        final registrationResponse = registrationResponseFromJson(responseJson);
        print(registrationResponse.data.token);
        Preferences.saveAuthId(registrationResponse.data.token);
        return registrationResponse;
      } else {
        final registrationErrorResponse =
            registrationErrorResponseFromJson(responseJson);
        return registrationErrorResponse;
      }
    } on DioException catch (e) {
      return e;
    }
  }

  static Future<dynamic> profileApi({
    required String imagePath,
    required String businessName,
    required String bussinessAddress,
    required String businessPhoneNumber,
    required String businessUrl,
  }
  ) async {
    
    print("Preferences.getUserId() ${Preferences.getUserId()}");
    Response response = await ApiMethods.postRequest(
      {"Accept": "application/json",
     "Authorization": "Bearer ${ Preferences.getAuthId()}"
      },
      data: {
        "profile_picture":
            await MultipartFile.fromFile(imagePath, filename: "jpeg",),
        "bussiness_name": businessName,
        "bussiness_address": bussinessAddress,
        "bussiness_number": businessPhoneNumber,
        "bussiness_url": businessUrl,
        "payment_type" :"paypal",
      },
      url: Constants.baseUrl + Constants.profileApi,
    );
    try {
      String responseJson = jsonEncode(response.data);
      debugPrint('object');
      print(responseJson);
  
      if (response.statusCode == 200) {
        
        final profileResponse = profileResponseFromJson(responseJson);
        print(profileResponse.data.token);
        print(profileResponse);
        return profileResponse;
      } else {
        final profileResponseError = profileResponseErrorFromJson(responseJson);
        return profileResponseError;
      }
    } on DioException catch (e) {
      return e;
      
    }
  }
 
  //  static Future<dynamic> homeApi() async{
  //   Response response = await ApiMethods.getMethod(
         
  //       context,
  //        headers:{ "Accept": "application/json"},
  //         url: Constants.baseUrl + Constants.homeApi,
  //         );
  //       print(response); 
        
  //     print('object');
        
  // }

}


