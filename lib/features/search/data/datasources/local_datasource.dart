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

    return list;
  }

  // Method to save search histories
  Future<void> saveSearchHistory(SearchHistoryModel searchHistory) async {
    final box = Hive.box("searchHistory");
    final list = List.from(box.values.toList());

    if (list.isNotEmpty) {
      if (list.first["searchHistory"] != searchHistory.searchHistory) {
        list.insert(0, searchHistory.toJson());
      }
    } else {
      list.insert(0, searchHistory.toJson());
    }

    final newList = [];

    for (int i = 0; i < list.length; i++) {
      newList.add(list[i]);
      if (newList.length == 3) {
        break;
      }
    }

    await box.clear();
    await box.addAll(List.from(newList));
  }

  Future<void> removeSearchHistory({required int index}) async {
    final box = Hive.box("searchHistory");
    final list = List.from(box.values.toList());

    list.removeAt(index);

    await box.clear();
    await box.addAll(List.from(list));
  }
}
