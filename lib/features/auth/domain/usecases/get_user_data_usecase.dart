import 'package:plant_store/features/auth/data/models/user_model.dart';
import 'package:plant_store/features/auth/domain/repositories/auth_repository.dart';

class GetUserDataUsecase {
  AuthRepository repository;

  GetUserDataUsecase({required this.repository});

  Future<UserModel> call() async {
    return await repository.getUserData();
  }
}
