import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/blocs/equipments_bloc/equipments_bloc.dart';
import 'package:plant_store/features/home/blocs/equipments_bloc/equipments_bloc_state.dart';
import 'package:plant_store/features/home/blocs/plants_bloc/plants_bloc.dart';
import 'package:plant_store/features/home/blocs/plants_bloc/plants_states.dart';
import 'package:plant_store/features/home/models/product_model.dart';
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
          final plantsBlocState = event.context.read<PlantsBloc>().state;
          final equipmentsBlocState =
              event.context.read<EquipmentsBloc>().state;
          if (plantsBlocState is PlantsBlocSuccessState) {
            listOfSearchedProducts.addAll(List.from(plantsBlocState.products));
          }

          if (equipmentsBlocState is EquipmentsBlocSuccessState) {
            listOfSearchedProducts
                .addAll(List.from(equipmentsBlocState.listOfProducts));
          }
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
        await removeSearchHistoryUsecase(searchHistory: event.searchHistory);

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
