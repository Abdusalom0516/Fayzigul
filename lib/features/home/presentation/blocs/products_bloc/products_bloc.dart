import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc_events.dart';
import 'package:plant_store/features/home/presentation/blocs/products_bloc/products_bloc_states.dart';

class ProductsBloc extends Bloc<ProductsBlocEvents, ProductsBlocStates> {
  ProductsBloc()
      : super(ProductsBlocStates(productsList: [], isLoading: false)) {
    on<OnGetProductsClicked>(
      (event, emit) {
        emit(state.copyWith(isLoading: true));

        try {

        } catch (e) {
          emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
        }
      },
    );
  }
}
