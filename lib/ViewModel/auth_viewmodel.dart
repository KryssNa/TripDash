import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripdash/Repositeries/auth_repositeries.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/Services/firebase_service.dart';
import 'package:tripdash/model/user_model.dart';

class AuthViewModel with ChangeNotifier {
  User? _user = FirebaseService.firebaseAuth.currentUser;

  User? get user => _user;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser => _loggedInUser;

  // register
  Future<void> register(UserModel user) async {
    try {
      var response = await AuthRepository().register(user);
      _user = response!.user;
      _loggedInUser = await AuthRepository().getUserDetail(_user!.uid);
      notifyListeners();
    } catch (err) {
      AuthRepository().logout();
      rethrow;
    }
  }

  // check login
  Future<void> checkLogin() async {
    try {
      _loggedInUser = await UserRepositeries.getLoggedInUser();
      if(_loggedInUser== null){
        _user = null;
        AuthRepository().logout();
        // throw Exception();
      }
      notifyListeners();
    } catch (err) {
      _user = null;
      AuthRepository().logout();
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await AuthRepository().logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
