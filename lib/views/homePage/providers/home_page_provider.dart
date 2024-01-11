import 'package:flutter/foundation.dart';
import 'package:pretestpts/controllers/apiServices/api_services.dart';
import 'package:pretestpts/models/user_model.dart';

class HomePageProvider extends ChangeNotifier {
  UserDetails? _userDetails = UserDetails();
  ApiService _apiService = ApiService();

  UserDetails? get userDetails => _userDetails;

  Future<void> setUserDetails() async {
    final response = await _apiService.getAllUsers();
    if (response != null) {
      if (response.data != null) {
        _userDetails = response;
        notifyListeners();
      }
    }
    notifyListeners();
  }
}
