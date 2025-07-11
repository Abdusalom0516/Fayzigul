import 'package:equatable/equatable.dart';

class SearchHistoryEntity extends Equatable {
  final String searchHistory;

  const SearchHistoryEntity({required this.searchHistory});

  @override
  List<Object?> get props => [searchHistory];
}
