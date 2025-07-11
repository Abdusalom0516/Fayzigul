import 'package:plant_store/features/search/data/models/search_history_model.dart';
import 'package:plant_store/features/search/domain/repositories/search_history_repository.dart';

class RemoveSearchHistoryUsecase {
  SearchHistoryRepository repository;
  RemoveSearchHistoryUsecase({required this.repository});

  Future<void> call({required SearchHistoryModel searchHistory}) async {
    await repository.removeSearchHistory(searchHistory);
  }
}
