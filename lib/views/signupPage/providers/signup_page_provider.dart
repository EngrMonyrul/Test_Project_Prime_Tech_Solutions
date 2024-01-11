import 'package:flutter/material.dart';
import 'package:pretestpts/controllers/localStorage/local_storage.dart';
import '../../../controllers/apiServices/api_services.dart';
import '../../../models/login_response.dart';

class SignupPageProvider extends ChangeNotifier {
  bool _hidePassword = true;
  LoginResponse _loginResponse = LoginResponse();
  final ApiService _apiService = ApiService();
  final LocalStorage _localStorage = LocalStorage();

  bool get hidePassword => _hidePassword;

  LoginResponse get loginResponse => _loginResponse;

  void setShowPass() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  Future<bool> setSignUp(
      {required String email,
      required String password,
      required String name}) async {
    final data = {
      "name": name,
      "email": email,
      "password": password,
    };
    final response = await _apiService.signupService(data: data);
    if (response != null) {
      if (response.data != null) {
        _loginResponse = response;
        notifyListeners();
        return true;
      } else {
        _loginResponse = response;
        notifyListeners();
        return false;
      }
    } else {
      return false;
    }
  }
}
