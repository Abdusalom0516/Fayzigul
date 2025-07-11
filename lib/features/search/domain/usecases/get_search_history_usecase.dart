import 'package:plant_store/features/search/data/models/search_history_model.dart';
import 'package:plant_store/features/search/domain/repositories/search_history_repository.dart';

class GetSearchHistoryUsecase {
  SearchHistoryRepository repository;
  GetSearchHistoryUsecase({required this.repository});

  Future<List<SearchHistoryModel>> call() async{
    return await repository.getSearchHistory();
  }
}
