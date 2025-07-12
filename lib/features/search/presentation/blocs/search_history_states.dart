import 'package:plant_store/features/search/data/models/search_history_model.dart';

class SearchHistoryStates {
  final List<SearchHistoryModel> listOfSearchHistories;
  final bool isSearching;

  SearchHistoryStates(
      {required this.listOfSearchHistories, required this.isSearching});

  SearchHistoryStates copyWith(
      {List<SearchHistoryModel>? listOfSearchHistories, bool? isSearching}) {
    return SearchHistoryStates(
        listOfSearchHistories:
            listOfSearchHistories ?? this.listOfSearchHistories,
        isSearching: isSearching ?? this.isSearching);
  }
}
