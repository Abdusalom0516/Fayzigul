import 'package:plant_store/features/search/data/models/search_history_model.dart';

abstract class SearchHistoryEvents {}

class OnGetSearchHistoryClicked extends SearchHistoryEvents {}

class OnSaveSearchHistoryClicked extends SearchHistoryEvents {
  final SearchHistoryModel searchHistory;

  OnSaveSearchHistoryClicked({required this.searchHistory});
}

class OnRemoveSearchHistoryClicked extends SearchHistoryEvents {
  final SearchHistoryModel searchHistory;

  OnRemoveSearchHistoryClicked({required this.searchHistory});
}

class OnSearchingEndClicked extends SearchHistoryEvents{}
