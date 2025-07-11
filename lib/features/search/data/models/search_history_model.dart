import 'package:plant_store/features/search/domain/entitties/search_history_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_history_model.g.dart';

@JsonSerializable()
class SearchHistoryModel extends SearchHistoryEntity {
  const SearchHistoryModel({required super.searchHistory});

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchHistoryModelToJson(this);

  SearchHistoryModel copyWith({String? searchHistory}) {
    return SearchHistoryModel(
        searchHistory: searchHistory ?? this.searchHistory);
  }
}
