import 'package:plant_store/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  // Method to get user data
  Future<UserModel> getUserData();

  // Method to save user data
  Future<void> saveUserData({required UserModel user});

  // Method to remove user data
  Future<void> removeUserData();
}
