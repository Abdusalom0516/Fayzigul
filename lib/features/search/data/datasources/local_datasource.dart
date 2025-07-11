import 'package:hive/hive.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';

class LocalDatasource {
  // Method to get search histories
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    List<SearchHistoryModel> list = [];
    final box = Hive.box("searchHistory");

    for (var elem in box.values.toList()) {
      list.add(SearchHistoryModel.fromJson(elem));
    }

    return list;
  }

  // Method to save search histories
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    final box = Hive.box("searchHistory");
    await box.add(searchHistory.toJson());
  }
}
