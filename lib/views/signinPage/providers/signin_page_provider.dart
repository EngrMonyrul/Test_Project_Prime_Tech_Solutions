import 'package:flutter/foundation.dart';
import 'package:pretestpts/controllers/apiServices/api_services.dart';
import 'package:pretestpts/controllers/localStorage/local_storage.dart';
import 'package:pretestpts/models/login_response.dart';

class SigninPageProvider extends ChangeNotifier {
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

  Future<bool> setSignIn(
      {required String email, required String password}) async {
    final data = {
      "email": email,
      "password": password,
    };
    final response = await _apiService.signinService(data: data);
    if (response != null) {
      if (response.data != null) {
        _localStorage.setBearerToken(token: response.data!.token!);
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
