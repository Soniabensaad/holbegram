import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../methods/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user; // Use 'User' instead of 'Users'
  final AuthMethod _authMethod = AuthMethod(); // Correct spelling to '_authMethod'

  User? get user => _user;

  Future<void> refreshUser() async {
    try {
      User userDetails = await _authMethod.getUserDetails(); // Use 'User' instead of 'Users'
      _user = userDetails;
      notifyListeners();
    } catch (e) {
      print("Error refreshing user: $e");
    }
  }
}
