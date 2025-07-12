import 'package:flutter/widgets.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';

abstract class SearchHistoryEvents {}

class OnGetSearchHistoryClicked extends SearchHistoryEvents {}

class OnSaveSearchHistoryClicked extends SearchHistoryEvents {
  final SearchHistoryModel searchHistory;
  final BuildContext context;

  OnSaveSearchHistoryClicked(
      {required this.searchHistory, required this.context});
}

class OnRemoveSearchHistoryClicked extends SearchHistoryEvents {
  final int index;

  OnRemoveSearchHistoryClicked({required this.index});
}

class OnSearchingEndClicked extends SearchHistoryEvents {}
