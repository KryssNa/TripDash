
import 'package:tripdash/model/user_model.dart';

abstract class UserServices {
  Future<UserModel> getUserById(String id);
  Future<void> updateUser(UserModel user);
  Future<UserModel> getLoggedInUser();
  Future<void> setUser(UserModel user);

}