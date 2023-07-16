
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripdash/model/user_model.dart';

class UserRepositeries {

  // get logged in user
  static Future<UserModel?> getLoggedInUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
      // throw Exception('User is not logged in.');// or handle the null user case as per your requirement
    }

    final userId = user.uid;
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      return UserModel(
        userId: userId,
        email: snapshot['email'],
        name: snapshot['name'],
        balance: snapshot['balance'],
        role: snapshot['role'],
      );
    } catch (e) {
      rethrow;
    }
  }


  static final CollectionReference _userReference =
  FirebaseFirestore.instance.collection('users');

  // set user
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.userId).set({
        'email': user.email,
        'name': user.name,
        'balance': user.balance,
        'role': user.role
      });
    } catch (e) {
      rethrow;
    }
  }

  // get user by id
  static Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();

      return UserModel(
          userId: id,
          email: snapshot['email'],
          name: snapshot['name'],
          balance: snapshot['balance'],
          role: snapshot['role']);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateUserBalance(String userId,int balance) async {
    try {
      await _userReference.doc(userId).update({
        'balance': balance,
      });

    } catch (e) {
      rethrow;
    }
  }

}