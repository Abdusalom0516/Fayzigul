import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/data/datasources/products_remote_data_sources.dart';
import 'package:plant_store/features/home/data/repositories/products_repository_implementation.dart';
import 'package:plant_store/features/home/domain/usecases/get_products_usecase.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc_events.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc_states.dart';

class ProductsBloc extends Bloc<ProductsBlocEvents, ProductsBlocStates> {
  ProductsBloc()
      : super(ProductsBlocStates(productsList: [], isLoading: false)) {
    on<OnGetProductsClicked>(
      (event, emit) async {
        ProductsRepositoryImplementation repository =
            ProductsRepositoryImplementation(
                remoteDataSources: ProductsRemoteDataSources());

        GetProductsUsecase getProductsUsecase =
            GetProductsUsecase(repository: repository);

        emit(state.copyWith(isLoading: true));

        try {
          emit(state.copyWith(
              productsList: await getProductsUsecase(), isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
        }
      },
    );
  }
}
