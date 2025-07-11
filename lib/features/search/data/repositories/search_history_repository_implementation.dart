import 'package:plant_store/features/search/data/datasources/local_datasource.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';
import 'package:plant_store/features/search/domain/repositories/search_history_repository.dart';

class SearchHistoryRepositoryImplementation extends SearchHistoryRepository {
  LocalDatasource localDatasource;

  SearchHistoryRepositoryImplementation({required this.localDatasource});

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    return await localDatasource.getSearchHistory();
  }

  @override
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    await localDatasource.saveSearchHistory(searchHistory);
  }

  @override
  Future<void> removeSearchHistory(SearchHistoryModel searchHistory) async {
    await localDatasource.removeSearchHistory(searchHistory);
  }
}
