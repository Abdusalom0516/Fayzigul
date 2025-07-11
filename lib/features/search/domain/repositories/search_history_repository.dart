import 'package:plant_store/features/search/data/models/search_history_model.dart';

abstract class SearchHistoryRepository {
  // Method to get search histories
  Future<List<SearchHistoryModel>> getSearchHistory();

  // Method to save search histories
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory);
}
