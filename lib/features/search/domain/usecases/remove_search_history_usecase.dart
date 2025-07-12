import 'package:plant_store/features/search/domain/repositories/search_history_repository.dart';

class RemoveSearchHistoryUsecase {
  SearchHistoryRepository repository;
  RemoveSearchHistoryUsecase({required this.repository});

  Future<void> call({required int index}) async {
    await repository.removeSearchHistory(index);
  }
}
