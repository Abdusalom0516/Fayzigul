import 'dart:convert';
import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveUserToLocalDatabase(UserModel user) async {
    final sharedPreferenceInstance = await SharedPreferences.getInstance();

    await sharedPreferenceInstance.setString("user", jsonEncode(user.toJson()));
  }

  Future<UserModel> getUserFromLocalDatabase() async {
    final sharedPreferenceInstance = await SharedPreferences.getInstance();

    return UserModel.fromJson(jsonDecode(
        sharedPreferenceInstance.getString("user") ?? "Unknown - 999"));
  }
}
