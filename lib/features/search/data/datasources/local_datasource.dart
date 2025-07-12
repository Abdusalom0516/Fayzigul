import 'package:hive/hive.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';

class LocalDatasource {
  // Method to get search histories
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    List<SearchHistoryModel> list = [];
    final box = Hive.box("searchHistory");

    for (var elem in List.from(box.values.toList())) {
      list.add(SearchHistoryModel.fromJson(elem));
    }

    return list.reversed.toList();
  }

  // Method to save search histories
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    final box = Hive.box("searchHistory");
    final list = List.from(box.values.toList());

    if (list.isNotEmpty) {
      if (list.last["searchHistory"] != searchHistory.searchHistory) {
        list.add(searchHistory.toJson());
      }
    } else {
      list.add(searchHistory.toJson());
    }

    await box.clear();
    await box.addAll(List.from(list));
  }

  Future<void> removeSearchHistory(SearchHistoryModel searchHistory) async {
    final box = Hive.box("searchHistory");
    final list = [];

    for (var elem in List.from(box.values.toList())) {
      final conv = SearchHistoryModel.fromJson(elem);
      if (conv.searchHistory != searchHistory.searchHistory) {
        list.add(elem);
      }
    }

    await box.clear();
    box.addAll(List.from(list));
  }
}
