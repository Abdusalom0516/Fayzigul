import 'package:plant_store/features/auth/domain/repositories/auth_repository.dart';

class RemoveUserUsecase {
  final AuthRepository repository;

  const RemoveUserUsecase({required this.repository});

  Future<void> call() async {
    await repository.removeUserData();
  }
}
