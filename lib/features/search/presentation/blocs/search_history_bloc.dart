import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/data/models/product_model.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:plant_store/features/search/data/datasources/local_datasource.dart';
import 'package:plant_store/features/search/data/models/search_history_model.dart';
import 'package:plant_store/features/search/data/repositories/search_history_repository_implementation.dart';
import 'package:plant_store/features/search/domain/usecases/get_search_history_usecase.dart';
import 'package:plant_store/features/search/domain/usecases/remove_search_history_usecase.dart';
import 'package:plant_store/features/search/domain/usecases/save_search_history_usecase.dart';
import 'package:plant_store/features/search/presentation/blocs/search_history_events.dart';
import 'package:plant_store/features/search/presentation/blocs/search_history_states.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvents, SearchHistoryStates> {
  SearchHistoryBloc()
      : super(SearchHistoryStates(
            listOfSearchHistories: [],
            isSearching: false,
            listOfSearchedProducts: [])) {
    final SearchHistoryRepositoryImplementation repository =
        SearchHistoryRepositoryImplementation(
            localDatasource: LocalDatasource());

    final getSearchHistoryUsecase =
        GetSearchHistoryUsecase(repository: repository);
    final saveSearchHistoryUsecase =
        SaveSearchHistoryUsecase(repository: repository);
    final removeSearchHistoryUsecase =
        RemoveSearchHistoryUsecase(repository: repository);

    on<OnGetSearchHistoryClicked>(
      (event, emit) async {
        List<SearchHistoryModel> listOfSearchHistories =
            await getSearchHistoryUsecase();
        emit(state.copyWith(listOfSearchHistories: listOfSearchHistories));
      },
    );

    on<OnSaveSearchHistoryClicked>(
      (event, emit) async {
        await saveSearchHistoryUsecase(searchHistory: event.searchHistory);
        List<ProductModel> listOfSearchedProducts = [];

        if (event.context.mounted) {
          final productsBlocState = event.context.read<ProductsBloc>().state;
          listOfSearchedProducts
              .addAll(List.from(productsBlocState.productsList));
        }

        emit(state.copyWith(
            listOfSearchHistories: await getSearchHistoryUsecase(),
            isSearching: true,
            listOfSearchedProducts: listOfSearchedProducts.where((element) {
              return element.name.toLowerCase().contains(
                  event.searchHistory.searchHistory.toLowerCase().trim());
            }).toList()));
      },
    );

    on<OnRemoveSearchHistoryClicked>(
      (event, emit) async {
        await removeSearchHistoryUsecase(index: event.index);

        emit(state.copyWith(
            listOfSearchHistories: await getSearchHistoryUsecase()));
      },
    );

    on<OnSearchingEndClicked>(
      (event, emit) {
        emit(state.copyWith(isSearching: false));
      },
    );
  }
}
