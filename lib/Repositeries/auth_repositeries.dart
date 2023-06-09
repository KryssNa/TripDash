import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tripdash/model/user_model.dart';
import 'package:tripdash/Services/firebase_service.dart';

class AuthRepository {
  CollectionReference<UserModel> userRef =
  FirebaseService.db.collection("users").withConverter<UserModel>(
    fromFirestore: (snapshot, _) {
      return UserModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );

  Future<UserCredential?> register(UserModel user) async {
    try {
      final response =
      await userRef.where("email", isEqualTo: user.email!).get();
      if (response.size != 0) {
        throw Exception("Email already exists");
      }
      UserCredential uc = await FirebaseService.firebaseAuth
          .createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

      user.userId = uc.user!.uid;
      user.fcmToken = "";
      user.balance=500000;
      user.role="normal";
      // insert into firestore user table
      // await userRef.add(user);
      await userRef.doc(uc.user!.uid).set(user);
      return uc;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential uc = await FirebaseService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return uc;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserDetail(String id) async {
    try {
      final response = await userRef.where("user_id", isEqualTo: id).get();

      var user = response.docs.single.data();
      user.fcmToken = "";
      await userRef.doc(user.userId).set(user);
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> resetPassword(String password, UserModel user) async {
    try {
      await FirebaseService.firebaseAuth.currentUser!.updatePassword(password);
      await userRef.doc(user.userId).set(user);

      return true;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseService.firebaseAuth.signOut();
    } catch (err) {
      rethrow;
    }
  }
}
