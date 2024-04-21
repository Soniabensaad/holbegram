import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../methods/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user; 
  final AuthMethod _authMethod = AuthMethod(); 
  Users? get user => _user;

  Future<void> refreshUser() async {
    try {
      Users userDetails = await _authMethod.getUserDetails(); 
      _user = userDetails;
      notifyListeners();
    } catch (e) {
      print("Error refreshing user: $e");
    }
  }
}
