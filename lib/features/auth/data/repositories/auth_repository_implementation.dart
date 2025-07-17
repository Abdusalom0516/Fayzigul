import 'package:plant_store/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:plant_store/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImplementation({required this.localDataSource});

  @override
  Future<UserModel> getUserData() async {
    return await localDataSource.getUserFromLocalDatabase();
  }

  @override
  Future<void> saveUserData({required UserModel user}) async {
    await localDataSource.saveUserToLocalDatabase(user);
  }
}
