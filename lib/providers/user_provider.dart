import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../methods/auth_methods.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  final AuthMethode _authMethod = AuthMethode();

  User get user => _user;

  Future<void> refreshUser() async {
    try {
      User user = await _authMethod.getUserDetails();
      _user = user;
      notifyListeners();
    } catch (e) {
      print("Error refreshing user: $e");
    }
  }
}
