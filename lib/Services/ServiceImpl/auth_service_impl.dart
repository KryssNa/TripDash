
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripdash/Services/ServiceImpl/user_service_impl.dart';
import 'package:tripdash/Services/auth_services.dart';
import 'package:tripdash/model/user_model.dart';

class AuthServicesImpl implements AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user =
      await UserServiceImpl().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(
      {required String email,
        required String password,
        required String name,
        String hobby = ''}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          userId: userCredential.user!.uid,
          email: email,
          name: name,
          balance: 280000000);

      await UserServiceImpl().setUser(user);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

}