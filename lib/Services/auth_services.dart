import 'package:tripdash/model/user_model.dart';

 abstract class AuthServices {

  Future<UserModel> signIn(
      {required String email, required String password});

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''});

  Future<void> signOut();

}

