import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Services/firebase_service.dart';
import '../model/user_model.dart';

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
      // insert into firestore user table
      await userRef.add(user);
      return uc;
    } catch (err) {
      rethrow;
    }
  }

}