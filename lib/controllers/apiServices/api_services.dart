import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pretestpts/controllers/localStorage/local_storage.dart';
import '../../models/login_response.dart';
import '../../models/user_model.dart';

class ApiService {
  LocalStorage localStorage = LocalStorage();
  final String _baseUrl = 'http://restapi.adequateshop.com/api';

  Future<UserDetails?> getAllUsers() async {
    final bearerToken = localStorage.getBearerToken;
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        UserDetails userDetails = UserDetails.fromJson(jsonBody);
        return userDetails;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  // updateUser(
  //     {required String url,
  //       required String bearerToken,
  //       required Map<String, dynamic> data}) async {
  //   try {
  //     final jsonData = json.encode(data);
  //     final response = await http.put(
  //       Uri.parse(_baseUrl + url),
  //       body: jsonData,
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $bearerToken',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print(response.body.toString());
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<LoginResponse?> signinService(
      {required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse('$_baseUrl/authaccount/login'),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(jsonBody);
        return loginResponse;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<LoginResponse?> signupService(
      {required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse('$_baseUrl/authaccount/registration'),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(jsonBody);
        return loginResponse;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
