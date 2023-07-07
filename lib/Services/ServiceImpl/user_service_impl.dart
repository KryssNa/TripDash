
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripdash/Services/user_services.dart';
import 'package:tripdash/model/user_model.dart';

class UserServiceImpl implements UserServices{

   @override
  Future<UserModel> getLoggedInUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    try {
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

      return UserModel(
          userId: userId!,
          email: snapshot['email'],
          name: snapshot['name'],
          balance: snapshot['balance']);
    } catch (e) {
      rethrow;
    }
  }

  final CollectionReference _userReference =
  FirebaseFirestore.instance.collection('users');

  @override
  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.userId).set({
        'email': user.email,
        'name': user.name,
        'balance': user.balance
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();

      return UserModel(
          userId: id,
          email: snapshot['email'],
          name: snapshot['name'],
          balance: snapshot['balance']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}