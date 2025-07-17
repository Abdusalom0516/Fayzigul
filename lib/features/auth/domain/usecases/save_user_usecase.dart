import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:plant_store/features/auth/domain/repositories/auth_repository.dart';

class SaveUserUsecase {
  AuthRepository repository;

  SaveUserUsecase({required this.repository});

  Future<void> call({required UserModel user}) async {
    await repository.saveUserData(user: user);
  }
}
