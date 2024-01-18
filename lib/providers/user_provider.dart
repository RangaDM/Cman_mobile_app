import 'package:c_man_mobapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethodes _authMethodes = AuthMethodes();
  //getter
  User get getUser => _user!;

  //methode for registering the user
  Future<void> refreshUser() async {
    User user = (await _authMethodes.getCurrentUser()) as User;
    _user = user;

    //notify the listeners
    notifyListeners();
  }
}