import 'package:plant_store/features/home/data/models/product_model.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';

class SearchHistoryStates {
  final List<SearchHistoryModel> listOfSearchHistories;
  final bool isSearching;
  final List<ProductModel> listOfSearchedProducts;

  SearchHistoryStates(
      {required this.listOfSearchHistories,
      required this.isSearching,
      required this.listOfSearchedProducts});

  SearchHistoryStates copyWith(
      {List<SearchHistoryModel>? listOfSearchHistories,
      bool? isSearching,
      List<ProductModel>? listOfSearchedProducts}) {
    return SearchHistoryStates(
        listOfSearchHistories:
            listOfSearchHistories ?? this.listOfSearchHistories,
        isSearching: isSearching ?? this.isSearching,
        listOfSearchedProducts:
            listOfSearchedProducts ?? this.listOfSearchedProducts);
  }
}
